# == Class beng_fw::params
#
# This class is meant to be called from beng_fw.
# It sets variables according to platform.
#
class beng_fw::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'beng_fw'
      $service_name = 'beng_fw'
    }
    'RedHat', 'Amazon': {
      $package_name = 'beng_fw'
      $service_name = 'beng_fw'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
