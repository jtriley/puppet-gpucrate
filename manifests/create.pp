# == Class: gpucrate::create
#
# Create hard-linked driver volume directories
#
class gpucrate::create {
  if ! empty($::nvidia_driver_version) {
    exec { 'create gpucrate volume':
      command => "${gpucrate::gpucrate_path} create",
      creates => "${gpucrate::volume_root}/${::nvidia_driver_version}",
    }
  }
}
