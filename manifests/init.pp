# == Class: gpucrate
#
# Full description of class gpucrate here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'gpucrate':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Justin Riley
#
# === Copyright
#
# Copyright 2017 Justin Riley, unless otherwise noted.
#
class gpucrate (
  $version         = $gpucrate::params::version,
  $package_name    = $gpucrate::params::package_name,
  $pip_params      = $gpucrate::params::pip_params,
  $volume_root     = $gpucrate::params::volume_root,
  $config_dir      = $gpucrate::params::config_dir,
  $config_file     = $gpucrate::params::config_file,
) inherits gpucrate::params {

  class { 'gpucrate::install': } ->
  class { 'gpucrate::config': } ->
  class { 'gpucrate::create': }

  contain 'gpucrate::install'
  contain 'gpucrate::config'
  contain 'gpucrate::create'

}
