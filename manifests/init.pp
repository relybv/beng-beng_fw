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
  $tcp_rangeA_src1 = $::beng_fw::params::tcp_rangeA_src1,
  $tcp_rangeA_src2 = $::beng_fw::params::tcp_rangeA_src2,
  $tcp_rangeA_src3 = $::beng_fw::params::tcp_rangeA_src3,
  $tcp_rangeB = $::beng_fw::params::tcp_rangeB,
  $tcp_rangeC = $::beng_fw::params::tcp_rangeC,
# parameter uit puppet v3 code
  $internal_netA    = '172.18.0.0/16',
  $internal_netB    = '172.19.0.0/16',
  $internal_netC    = '178.249.248.128/25',
  $tcp_ports        = $::beng_fw::params::tcp_ports_global,
# Port range 9300-9400, with variable source rules
  $tcp_rangeA_ports = '9300-9400',
  #$tcp_rangeA_src1  = $::beng_fw::tcp_9300_source1,
  #$tcp_rangeA_src2  = $::beng_fw::tcp_9300_source2,
  #$tcp_rangeA_src3  = $::beng_fw::tcp_9300_source3,
# UDP ports
  $udp_ports = [ '53','123','161'],
) inherits ::beng_fw::params {

  # validate parameters here
  validate_bool($tcp_public_ports)

  class { '::beng_fw::install': } ->
  Class[ '::beng_fw' ]
}
