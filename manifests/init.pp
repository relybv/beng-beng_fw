# == Class: beng_fw
#
# Full description of class beng_fw here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class beng_fw
(
  $package_name = $::beng_fw::params::package_name,
  $service_name = $::beng_fw::params::service_name,
) inherits ::beng_fw::params {

  # validate parameters here
  validate_string($package_name)
  validate_string($service_name)

  class { '::beng_fw::install': } ->
  class { '::beng_fw::config': } ~>
  class { '::beng_fw::service': } ->
  Class['::beng_fw']
}
