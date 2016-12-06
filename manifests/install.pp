# == Class beng_fw::install
#
# This class is called from beng_fw for install.
#
class beng_fw::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  resources { 'firewall':
    purge => true,
  }
  Firewall {
    before  => Class['beng_fw::postv4'],
    require => Class['beng_fw::prev4'],
  }
  class { ['beng_fw::prev4', 'beng_fw::postv4']: }
}
