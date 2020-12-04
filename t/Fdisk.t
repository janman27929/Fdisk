use lib qw(. .. t lib ../lib);

use v5.16;
use Test2::V0; 
use Test2::Plugin::DieOnFail;
use Modern::Perl;
use File_mgr;
use Carp::Always;
require Rdd_Mocks;

use base qw(Test::Class);

my %global_mocks=();
my $pkg_name = 'Fdisk';
my @mocks;
my $test_ENV;
my $fdisk_test_file = 't/fdisk.01.txt';
my $ENV_test_parm = 'ENV_PASS_01';

#-------------------------[ TEST HARNESS METHODS HERE ]-------------------------
# this runs only ONCE, on program startup
sub startup   : Test(startup) {
  my $objs = shift;
  require $pkg_name . ".pm";

  load_mock($pkg_name);
  init_mocks(\%global_mocks);
}

# this runs BEFORE each and every test
sub setup : Test(setup) {
  my $objs = shift;
  $objs->{base} = Fdisk->new();  
  $fdisk_test_file = 't/fdisk.01.txt';
  $ENV_test_parm = 'ENV_PASS_01';
  @mocks = set_mocks(
    [(qw(Fdisk get_ENV)   , \&test_get_ENV)   ],
    [(qw(Fdisk _get_fdisk), \&test_get_fdisk) ],
  );

  #setup %ENV for testing
  $test_ENV = scalar get_mock($ENV_test_parm);
  $objs->{base}->clr_debug;
}

# this runs AFTER each and every test
sub teardown : Test(teardown) {
  my $self = shift;
}

# this runs only ONCE, on program exit
sub shutdown  : Test(shutdown) {
  my $self = shift;
}

#-------------------------------[ UNIT TESTS HERE ]-----------------------------
sub test_get_fdisk {
  my ($self,) = @_;
  chomp(my @tmp = File_mgr->slurp($fdisk_test_file));
  @tmp;
}

sub test_get_ENV {
  my ($self, $k) = @_;
  return $test_ENV->{$k} if $k;
  print "$_:$test_ENV->{$_}\n" for sort keys %$test_ENV;
}

sub write_cmds : Test(no_plan) {
  #my @mocks = set_mock (qw(MODULE METHOD MOCK));

  my $self  = shift->{base};  
  #my $self  = $pkg_name->new();  
  $self->setup;
  $self->gen_cmds;
  $self->preview_cmds;
  print '-'x30, '[ write_cmds ]', '-'x30 ,"\n";
  $DB::single = 1; 
  $DB::single = 1; 
}

sub AB_test_verify_disks_fail : Test(no_plan) {
  #my @mocks = set_mock (qw(MODULE METHOD MOCK));

  my $self  = shift->{base};  
  $test_ENV = scalar get_mock('ENV_FAIL_01');
  $self->process_env;
  $self->get_fdisk;
  like ( dies{$self->verify_disks}, qr/no :get_fra_disk_list:sdj: found on remote host:my_host:/,"Got exception"); 
  print '-'x30, '[ test_verify ]', '-'x30 ,"\n";
}

sub AA_test_verify_disks_pass : Test(no_plan) {
  #my @mocks = set_mock (qw(MODULE METHOD MOCK));

  my $self  = shift->{base};  
  $self->process_env;
  $self->get_fdisk;
  is $self->verify_disks, 1, 'verify_disks pass';
  print '-'x30, '[ test_verify ]', '-'x30 ,"\n";
}

sub test_env : Test(no_plan) {

  my $self  = shift->{base};  
  $self->process_env;
  is $self->get_ENV('SID') , 'my_sid_test', 'my_sid_test';
  is $self->get_ENV('SID_1') , undef, 'SID_1';
  is $self->has_data_disk(''), 0, 'is: has null';
  is $self->has_data_disk('sdb'), 1, 'is: has sdb';
  is $self->has_data_disk('sDb'), 0, 'does NOT have sDb';
  is $self->has_fra_disk('sdi'), 1, 'has FRA disk sdi';
  is $self->has_fra_disk('sdj'), 0, 'does not FRA disk sdj';
  print '-'x30, '[ test_env ]', '-'x30 ,"\n";
}

sub AA_test_Fdisk_no_partitions : Test(no_plan) {
  #my @mocks = set_mock (qw(MODULE METHOD MOCK));
  $fdisk_test_file = 't/fdisk.no_partitions.txt';
  @mocks = set_mocks(
    [(qw(Fdisk _get_fdisk), \&test_get_fdisk)],
  );
  my $self  = shift->{base};  
  $self->process_env;
  $self->get_fdisk;
  is  ref $self, 'Fdisk', 'is: ref $self';
  is  $self->has_disk('sdf'), 1, 'is: diskf exists'; 
  is  $self->has_disk('sdff'), 0, 'is: diskff not exists'; 
  is  $self->disk_has_partition('sdf'), 0, 'is: diskf has no partition'; 
  is  $self->disk_has_partition('sdfd'), 0, 'is: diskfd has no partition'; 

  print '-'x30, '[ AA_test_Fdisk_no_partitions ]', '-'x30 ,"\n";
}  


sub AB_test_Fdisk_with_partitions : Test(no_plan) {

  my $self  = shift->{base};  
  $self->process_env;
  $self->get_fdisk;
  is  ref $self, 'Fdisk', 'is: ref $self';
  is  $self->has_disk('sdf'), 1, 'is: diskf exists'; 
  is  $self->has_disk('sdff'), 0, 'is: diskff not exists'; 
  is  $self->disk_has_partition('sdf'), 1, 'is: diskf has partition'; 
  is  $self->disk_has_partition('sdfd'), 0, 'is: diskfd has no partition'; 

  print '-'x30, '[ AB_test_Fdisk_with_partitions ]', '-'x30 ,"\n";
}

#-------------------------------[ Infra commands ]-----------------------------
if (! caller()) {Test::Class->runtests}

