# == Class: gpucrate::create
#
# Create hard-linked driver volume directories
#
class gpucrate::create {
  exec { 'create gpucrate volume':
    command => "${gpucrate::gpucrate_path} create",
  }
}
