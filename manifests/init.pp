# Class: ssh
# ===========================
#
# Full description of class ssh here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'ssh':
 #      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2017 Your name here, unless otherwise noted.
#
class ssh(
  #Integer $port = $::ssh::params::port,
  #Boolean $permit_root_login = $::ssh::params::permit_root_login,
  #String $package_name = $::ssh::params::package_name,
  #String $service_name = $::ssh::params::service_name,

  Integer $port = 22,
  Boolean $permit_root_login = false,
  String $package_name,
  String $ensure,
  String $service_name, 
  String $service_ensure,
  Boolean $service_enable,

) inherits ::ssh::params {

 notify {"node_scope_var":
 
 message        => "THis is TOP scope var --> ${::test_top_scope} -- given in ssh"
 #message       => "THis is node scope var ${node_scope_var} given in ssh"
 
 } 

#class { '::ssh::install': } ->
  
  class { '::ssh::service':
    #class { '::ssh::install': 
    #before => Class[ '::ssh::service' ]
  }

  class { '::ssh::config': 
  
  }

  class { '::ssh::install':
    #class { '::ssh::service': 
    #require => Class[ '::ssh::install' ]
    #before  =>  Class[ '::ssh::service' ]
   }

   
   Class[ '::ssh::install' ] -> Class[ '::ssh::config' ] ~> Class[ '::ssh::service' ] -> Class['ssh']


}
