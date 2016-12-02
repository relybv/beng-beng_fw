# == Class beng_fw::prev4
#
# This class is called from beng_fw for pre config.
#
class beng_fw::prev4 {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

}
