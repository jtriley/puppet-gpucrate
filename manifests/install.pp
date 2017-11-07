# == Class: gpucrate
#
# Install gpucrate using python pip
#
class gpucrate::install {
  include ::python
  include ::singularity

  $default_pip_params = {
    ensure     => $gpucrate::version,
    pkgname    => $gpucrate::package_name,
  }

  create_resources('python::pip', {
    $gpucrate::package_name => merge($default_pip_params, $gpucrate::pip_params),
  })
}
