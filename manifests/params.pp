# == Class: gpucrate::params
#
# Default parameter values for the gpucrate module
#
class gpucrate::params {
  $version = 'present'
  $package_name = 'gpucrate'
  $pip_params = {}
  $volume_root = '/usr/local/gpucrate'
  $config_dir = '/etc/gpucrate'
  $config_file = "${config_dir}/config.yaml"
  $gpucrate_path = '/usr/bin/gpucrate'
}
