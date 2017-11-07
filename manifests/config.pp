# == Class: gpucrate::config
#
# Setup gpucrate config file
#
class gpucrate::config {
  file { 'gpucrate config directory':
    ensure => directory,
    path   => $gpucrate::config_dir,
  }

  file { 'gpucrate config file':
    ensure  => present,
    path    => $gpucrate::config_file,
    content => template('gpucrate/config.yaml.erb'),
    require => File['gpucrate config directory']
  }
}
