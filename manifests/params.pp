# == Class beng_fw::params
#
# This class is meant to be called from beng_fw.
# It sets variables according to platform.
#
class beng_fw::params {
  $tcp_public_ports = false
  $tcp_ports_global = [ '20','21','22','80','443','445','1556','5666','8000','9100','9200','13720','13724' ]
  $tcp_rangea_src1 = false
  $tcp_rangea_src2 = false
  $tcp_rangea_src3 = false
  $tcp_9300_source1 = false
  $tcp_9300_source2 = false
  $tcp_9300_source3 = false
  $tcp_rangeb = '8080-8095'
  $tcp_rangec = '8011-8015'
  $internal_neta = '172.18.0.0/16'
  $internal_netb = '172.19.0.0/16'
  $internal_netc = '178.249.248.128/25'
  $internal_netd = '192.168.20.0/23'
  $internal_nete = '10.100.0.0/16'
  $udp_ports = [ '53','123','161']
  $tcp_rangea_ports = false
  $tcp_extra_rule1 = false
  $tcp_extra_rule1_dport = false
  $tcp_extra_rule1_source = false
  $tcp_extra_rule2 = false
  $tcp_extra_rule2_dport = false
  $tcp_extra_rule2_source = false
 # Default and extra tcp ports
  case $::hostname {
  /^(ltas1|lbas[123]|mws1)/ : {
 #notice ( "Firewall: ${hostname} - Applying 'extra tcp ports ('18086 and 8161')' rule." )
    $tcp_ports_global = [ '21','22','80','443','445','1556','5666','8000','8161','9100','9200','13720','13724','18086' ]    # call A1601 692 m1710 1445
  }
  /^(ltes1|lbes3)/ : {
 #notice ( "Firewall: ${hostname} - Applying 'extra tcp port  ('3306')' rule at ltes1 and lbes3 ." )
    $tcp_ports_global = [ '21','22','80','443','445','1556','3306','5666','8000','9100','9200','13720','13724' ]    # call m1711 960
  }
  default: {
 #notice ( "Firewall: ${hostname} - Using default tcp_ports rule." )
    $tcp_ports_global =$::beng_fw::params::tcp_ports_global
  }
  }
}
