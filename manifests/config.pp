# == Class beng_fw::config
#
# This class is called from beng_fw for service config.
#
class beng_fw::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

}
