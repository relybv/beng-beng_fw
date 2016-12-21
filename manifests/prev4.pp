# == Class beng_fw::prev4
#
# This class is called from beng_fw for pre config.
#
class beng_fw::prev4 {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  Firewall {
    require => undef,
  }

  # Default firewall rules
  firewall { '000 accept all icmp':
    proto    => 'icmp',
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '001 accept all to lo interface':
    proto    => 'all',
    iniface  => 'lo',
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '002 accept related established rules':
    proto    => 'all',
    state    => ['RELATED', 'ESTABLISHED'],
    action   => 'accept',
    provider => 'iptables',
  }

  # Check if public ports should be allowed
  if $::beng_fw::tcp_public_ports != false {
      firewall { '003 accept all TCP':
      dport    => $::beng_fw::tcp_public_ports,
      proto    => 'tcp',
      action   => 'accept',
      provider => 'iptables',
    }
  }

  # Default TCP Ports
  firewall { '010 allow internal netA TCP':
    dport    => $::beng_fw::tcp_ports_global,
    proto    => 'tcp',
    source   => $::beng_fw::internal_neta,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '011 allow internal netB TCP':
    dport    => $::beng_fw::tcp_ports_global,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netb,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '012 allow internal netC TCP':
    dport    => $::beng_fw::tcp_ports_global,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netc,
    action   => 'accept',
    provider => 'iptables',
  }
  # Museum network added 23122016
  firewall { '013 allow internal netD TCP':
    dport    => $::beng_fw::tcp_ports_global,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netd,
    action   => 'accept',
    provider => 'iptables',
  }

  # Check if extra rule 1 is specified
  if $::beng_fw::tcp_extra_rule1 != false {
    firewall { '013 allow internal net TCP':
      dport    => $::beng_fw::tcp_extra_rule1_dport,
      proto    => 'tcp',
      source   => $::beng_fw::tcp_extra_rule1_source,
      action   => 'accept',
      provider => 'iptables',
    }
  }
  # Check if extra rule 2 is specified
  if $::beng_fw::tcp_extra_rule2 != false {
    firewall { '014 allow internal net TCP':
      dport    => $::beng_fw::tcp_extra_rule2_dport,
      proto    => 'tcp',
      source   => $::beng_fw::tcp_extra_rule2_source,
      action   => 'accept',
      provider => 'iptables',
    }
  }

  # RANGE A
  if $::beng_fw::tcp_rangea_src1 != false {
    firewall { '015 allow internal netA TCP range':
      dport    => $::beng_fw::tcp_rangea_ports,
      proto    => 'tcp',
      source   => $::beng_fw::tcp_rangea_src1,
      action   => 'accept',
      provider => 'iptables',
    }
  }
  if $::beng_fw::tcp_rangea_src2 != false {
    firewall { '016 allow internal netA TCP range':
      dport    => $::beng_fw::tcp_rangea_ports,
      proto    => 'tcp',
      source   => $::beng_fw::tcp_rangea_src2,
      action   => 'accept',
      provider => 'iptables',
    }
  }
  if $::beng_fw::tcp_rangea_src3 != false {
    firewall { '017 allow internal netA TCP range':
      dport    => $::beng_fw::tcp_rangea_ports,
      proto    => 'tcp',
      source   => $::beng_fw::tcp_rangea_src3,
      action   => 'accept',
      provider => 'iptables',
    }
  }

  # RANGE B
  firewall { '025 allow internal netA TCP rangeB':
    dport    => $::beng_fw::tcp_rangeb,
    proto    => 'tcp',
    source   => $::beng_fw::internal_neta,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '026 allow internal netB TCP rangeB':
    dport    => $::beng_fw::tcp_rangeb,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netb,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '027 allow internal netC TCP rangeB':
    dport    => $::beng_fw::tcp_rangeb,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netc,
    action   => 'accept',
    provider => 'iptables',
  }
# Museum network added 23122016
  firewall { '028 allow internal netd TCP rangeB':
    dport    => $::beng_fw::tcp_rangeb,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netd,
    action   => 'accept',
    provider => 'iptables',
  }

  # RANGE C
  firewall { '035 allow internal netA TCP rangeC':
    dport    => $::beng_fw::tcp_rangec,
    proto    => 'tcp',
    source   => $::beng_fw::internal_neta,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '036 allow internal netB TCP rangeC':
    dport    => $::beng_fw::tcp_rangec,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netb,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '037 allow internal netC TCP rangeC':
    dport    => $::beng_fw::tcp_rangec,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netc,
    action   => 'accept',
    provider => 'iptables',
  }
# Museum network added 23122016
  firewall { '038 allow internal netD TCP rangeC':
    dport    => $::beng_fw::tcp_rangec,
    proto    => 'tcp',
    source   => $::beng_fw::internal_netd,
    action   => 'accept',
    provider => 'iptables',
  }

  # UDP rules
  firewall { '020 allow internal netA UDP':
    dport    => $::beng_fw::udp_ports,
    proto    => 'udp',
    source   => $::beng_fw::internal_neta,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '021 allow internal netB UDP':
    dport    => $::beng_fw::udp_ports,
    proto    => 'udp',
    source   => $::beng_fw::internal_netb,
    action   => 'accept',
    provider => 'iptables',
    }
  firewall { '022 allow internal netC UDP':
    dport    => $::beng_fw::udp_ports,
    proto    => 'udp',
    source   => $::beng_fw::internal_netc,
    action   => 'accept',
    provider => 'iptables',
  }

}
