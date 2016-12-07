# == Class beng_fw::params
#
# This class is meant to be called from beng_fw.
# It sets variables according to platform.
#
class beng_fw::params {
  $tcp_public_ports = false,
  $tcp_ports_global = false,
  $tcp_extra_rule1 = false,
  $tcp_rangea_src1 = false,
  $tcp_rangea_src2 = false,
  $tcp_rangea_src3 = false,
  $tcp_9300_source1= false,
  $tcp_9300_source2= false,
  $tcp_9300_source3= false,
  $tcp_rangeb = false,
  $tcp_rangec = false,
 # $internal_neta = false,
 # $internal_netb = false,
 # $internal_netc = false,
#  $udp_ports = false
  # parameter uit puppet v3 code
  $internal_neta    = '172.18.0.0/16',
  $internal_netb    = '172.19.0.0/16',
  $internal_netc    = '178.249.248.128/25',
# Port range 9300-9400, with variable source rules
  $tcp_rangea_ports = '9300-9400',
# UDP ports
  $udp_ports = [ '53','123','161'],
}
