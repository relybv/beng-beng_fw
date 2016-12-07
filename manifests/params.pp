# == Class beng_fw::params
#
# This class is meant to be called from beng_fw.
# It sets variables according to platform.
#
class beng_fw::params {
  $tcp_public_ports = false
  $tcp_ports_global = false
  $tcp_extra_rule1 = false
  $tcp_rangea_src1 = false
  $tcp_rangea_src2 = false
  $tcp_rangea_src3 = false
  $tcp_9300_source1= false
  $tcp_9300_source2= false
  $tcp_9300_source3= false
  $tcp_rangeb = false
  $tcp_rangec = false
  $internal_neta = false
  $internal_netb = false
  $internal_netc = false
  $udp_ports = false
}
