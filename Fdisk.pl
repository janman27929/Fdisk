use lib qw(. .. t lib ../lib /rdd/proj/lib);

use RDD;
use Fdisk;

#---------------------[ USER_PARMS_START]---------------------
my $main_tag = 'Fdisk';

my $defaults = {
};

my $rh_config = { %$defaults };

my $getopt_parms = {
  #'dob=s'	  => \$rh_config->{dob},  
  #'length=i' => \$rh_config->{length},  
  #"verbose"  => \$rh_config->{verbose},
  #"library=s@" => \$rh_config->{library},
  #"defines=s%" => \$rh_config->{defines},
};   

my $usage_msg =<< 'EOF';
--------------------------------------------
Fdisk.pl [my_new_host.env]
--------------------------------------------

reads an env files and creates ASM drives 

my_new_host.env format
HOST          => 'my_host',
IP            => '10.88.99.11',
SID           => 'my_sid_test',
SOURCE        => 'source_host',			 
TSM_SERVER    => 'my_tsm_server',
ASM_DISK_DATA => ' SDB sdc sdd sde sdf ',
ASM_DISK_FRA  => ' sdg sdh   sdj  ',


EOF

#---------------------[ USER_PARMS_END]---------------------
my $self; 

sub ShowError {
  my ($usage_msg, $sys_err_msg) = @_;
  print $sys_err_msg, "\n" if $sys_err_msg;   
  print $usage_msg, "\n"   if $usage_msg;
  exit $?;
}

eval {
  Getopt::Long::GetOptions (%$getopt_parms) or die ("FAIL: CLI errors");

  $self = $main_tag->new(%$rh_config);

  $self->setup();
  $self->main ();
  $self->teardown();
};

ShowError($usage_msg, $@) if $@;

$DB::single = 1; 
$DB::single = 1; 


