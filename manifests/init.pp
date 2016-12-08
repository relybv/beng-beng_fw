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
  $tcp_public_ports = $::beng_fw::params::tcp_public_ports,
  $tcp_ports_global = $::beng_fw::params::tcp_ports_global,
  $tcp_extra_rule1 = $::beng_fw::params::tcp_extra_rule1,
  $tcp_rangea_src1 = $::beng_fw::params::tcp_rangea_src1,
  $tcp_rangea_src2 = $::beng_fw::params::tcp_rangea_src2,
  $tcp_rangea_src3 = $::beng_fw::params::tcp_rangea_src3,
  $tcp_rangeb = $::beng_fw::params::tcp_rangeb,
  $tcp_rangec = $::beng_fw::params::tcp_rangec,
  $internal_neta = $::beng_fw::params::internal_neta,
  $internal_netb = $::beng_fw::params::internal_netb,
  $internal_netc = $::beng_fw::params::internal_netc,
  $tcp_ports        = $::beng_fw::params::tcp_ports_global,
  $tcp_rangea_src1  = $::beng_fw::params::tcp_9300_source1,
  $tcp_rangea_src2  = $::beng_fw::params::tcp_9300_source2,
  $tcp_rangea_src3  = $::beng_fw::params::tcp_9300_source3,
  $udp_ports = $::beng_fw::params::udp_ports,
) inherits ::beng_fw::params {

  # validate parameters here
  # validate_bool($tcp_public_ports)

  class { '::beng_fw::install': } ->
  Class[ '::beng_fw' ]
}
