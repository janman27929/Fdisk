use lib qw(. .. t lib ../lib);
use Modern::Perl;

package Fdisk::Create_asm {

my %cmds_template = (
  format      => '(echo o; echo n; echo p; echo 1; echo ; echo; echo w) | fdisk /dev/<DISK>',
  create_asm  => 'oracleasm createdisk <ASM_DEV> /dev/<DISK>1',
  final_cmd   => 'chown -R oracle:dba /dev/oracleasm/disks',
);

sub new {
  my ($class, %parms) = @_;
  my %defaults = (
    data_disks           => {},
    fra_disks            => {},
    create_asm_disk_cmds => [],
  );
  my $self = bless{%defaults, %parms}, $class;
  $self;
}

sub get_data_disk_list {
  my @tmp = sort keys %{$_[0]->{data_disks}};
  wantarray ? @tmp : \@tmp;  
}

sub get_fra_disk_list  {
  my @tmp = sort keys %{$_[0]->{fra_disks}};
  wantarray ? @tmp : \@tmp;  
}

sub gen_cmds {
  my ($self,) = @_;
  $self->gen_disk_cmds(scalar $self->get_data_disk_list, 'DATA');
  $self->gen_disk_cmds(scalar $self->get_fra_disk_list, 'FRA');
  $self->add_disk_cmd($cmds_template{final_cmd});
  $self;
}

sub gen_disk_cmds {
  my ($self, $list, $tag) = @_;
  my $cntr = 0;
  for my $disk_dev (@$list) {
    my $format_cmd = $cmds_template{format};
    my $asm_cmd    = $cmds_template{create_asm};
    my $asm_cntr   = sprintf("%s%03d", $tag, $cntr++);
    for ($format_cmd, $asm_cmd) {
      s/<DISK>/$disk_dev/g;
      s/<ASM_DEV>/$asm_cntr/g;
    }    
    $self->add_disk_cmd($format_cmd, $asm_cmd);
  }
}

sub add_disk_cmd {
  my $self = shift;
  push @{$self->{create_asm_disk_cmds}}, $_ for @_;
}

sub preview_cmds { $_[0]->set_debug; print "$_\n" for ($_[0]->create_asm_disk_cmds) }


sub run_cmds {
  my ($self,) = @_;
  'run_cmds';
}

}#-- Fdisk::Create_asm

package Fdisk {
use base qw(Fdisk::Create_asm RDD);

my @ENV_keys = qw(HOST IP SID SOURCE TSM_SERVER ASM_DISK_DATA ASM_DISK_FRA);
#my $self;

my @dispatch = (
  [qr/^Disk \/dev\/(sd\S):\s+(\S+ \S+),\s+\d+\s+bytes, \d+ sectors/, \&add_whole_disk], 
  [qr/^\/dev\/(sd\S+)1\s+\d+\s+\d+\s+\d+/ , \&add_disk_with_partition], 
);

my %ENV_dispatch = (
  ASM_DISK_DATA => \&add_data_disk,
  ASM_DISK_FRA  => \&add_fra_disk,
);

sub new {
  my ($class, %parms) = @_;
  my %defaults = (
    disks     => {},
    run_cmds  => 0,
    asm_disk  => Fdisk::Create_asm->new(),
  );
  my $self = bless{%defaults, %parms}, $class;
  $self;
}

sub setup     {
  my $self=shift; 
  $self->process_env;
  $self->get_fdisk;
  $self->verify_disks;
}

sub verify_disks {
  my ($self,) = @_;
  die ("FAIL: no disks\n")      unless $self->disks;  
  die ("FAIL: no data_disks\n") unless $self->get_data_disk_list;
  die ("FAIL: no fra_disks\n")  unless $self->get_fra_disk_list;
    
  die ("FAIL: no \$HOST\n") unless my $targ_host = $self->get_ENV('HOST');
  $self->chk_data_disks($targ_host);
  $self->chk_fra_disks($targ_host);
  return 1;
}

sub chk_data_disks {my $self = shift; $self->chk_disks('get_data_disk_list', @_)}
sub chk_fra_disks  {my $self = shift; $self->chk_disks('get_fra_disk_list', @_)}
sub get_data_disk_list { $_[0]->asm_disk->get_data_disk_list}
sub get_fra_disk_list  { $_[0]->asm_disk->get_fra_disk_list}
sub gen_cmds           { $_[0]->asm_disk->gen_cmds}

sub chk_disks {
  my ($self, $tag, $targ_host) = @_;
  for ($self->$tag) {
    next if $self->has_disk($_);
    die ("FAIL: no :$tag:$_: found on remote host:$targ_host:\n");
  }
}

sub get_disk_list { sort keys %{$_[0]->disks} }

sub teardown  {my $self=shift;$self->NEXT::teardown(@_)      }

sub process_env {
  my ($self,) = @_;
  LOOP:
  for my $key (@ENV_keys) {
    die ("FAIL: no env value for $key\n") unless (my $ENV_val = $self->get_ENV($key));
    next unless my $cb = $ENV_dispatch{$key};
    $cb->($self, $ENV_val);
  }
}

sub has_data_disk { $_[0]->asm_disk->{data_disks}->{$_[1]} ? 1 : 0 }
sub has_fra_disk  { $_[0]->asm_disk->{fra_disks}->{$_[1] } ? 1 : 0 }
sub get_ENV       { $ENV{$_[1]} }

sub add_data_disk {
  my ($self, $str) = @_;
  die ("FAIL: no str\n") unless $str;
  $str =~ s/^\s+//g;
  $self->asm_disk->{data_disks}->{$_}++ for (split(/\s+/,lc($str)));
}

sub add_fra_disk {
  my ($self, $str) = @_;
  die ("FAIL: no str\n") unless $str;
  $str =~ s/^\s+//g;
  $self->asm_disk->{fra_disks}->{$_}++ for (split(/\s+/,lc($str)));
}

sub add_whole_disk          { $_[0]->disks->{$_[1]}{size} = $_[2] }
sub add_disk_with_partition { $_[0]->disks->{$_[1]}{has_partition}++ } 

sub disk_has_partition {
  my ($self, $disk) = @_;
  die ("FAIL: no disk\n") unless ($disk);
  $self->disks->{$disk}{has_partition} ? 1 : 0;
}

sub has_disk {
  my ($self, $disk) = @_;
  die ("FAIL: no disk\n") unless ($disk);
  $self->disks->{$disk} ? 1 : 0;
}

sub get_fdisk {
  my ($self,) = @_;
  TOP_LOOP:
  for ($self->_get_fdisk()) {
    next TOP_LOOP if /^\s*$/;
    DISPATCH_LOOP:
    for my $qr_row (@dispatch) {
      next DISPATCH_LOOP unless /$qr_row->[0]/;
      $qr_row->[1]->($self, $1,$2,$3,$4,$5);
    }
  }
}

sub _get_fdisk {
  my ($self, $host) = @_;
  chomp(my @tmp = qx(timeout 60 ssh -Tq $host fdisk -l));
  die ("FAIL: _get_fdisk:$host:rtn:$?\n") if ($?);
  @tmp;
}


1;
}#----- Fdisk -----

=head1 NAME

uses standard DB_MIG env values to create oracle ASM disks on remote server $HOST
based
on ASM_DISK* env values

will fail if:
  disks on $HOST 
    do not exist
    have partitions
  $ENV keys are not set 

=head1 DESCRIPTION

\$ENV must have these values set ( @ENV_keys )
HOST IP SID SOURCE TSM_SERVER ASM_DISK_DATA ASM_DISK_FRA

ASM* will be \s+ separated str ref'ing each ASM disk type

=head1 SYNOPSIS

source MY_HOST.env
perl Fdisk.pm

=cut
