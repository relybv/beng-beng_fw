# == Class beng_fw::install
#
# This class is called from beng_fw for install.
#
class beng_fw::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  package { $::beng_fw::package_name:
    ensure => present,
  }
}
