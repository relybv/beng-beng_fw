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
  if $tcp_public_ports != false {
      firewall { '003 accept all TCP':
      dport    => $tcp_public_ports,
      proto    => 'tcp',
      action   => 'accept',
      provider => 'iptables',
    }
  }

  # Default TCP Ports
  firewall { '010 allow internal netA TCP':
    dport    => $tcp_ports,
    proto    => 'tcp',
    source   => $internal_netA,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '011 allow internal netB TCP':
    dport    => $tcp_ports,
    proto    => 'tcp',
    source   => $internal_netB,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '012 allow internal netC TCP':
    dport    => $tcp_ports,
    proto    => 'tcp',
    source   => $internal_netC,
    action   => 'accept',
    provider => 'iptables',
  }

  # Check if extra rule 1 is specified
  if is_hash($tcp_extra_rule1) {
    firewall { '013 allow internal net TCP':
      dport    => $tcp_extra_rule1[dport],
      proto    => 'tcp',
      source   => $tcp_extra_rule1[source],
      src_range=> $tcp_extra_rule1[src_range],
      action   => 'accept',
      provider => 'iptables',
    }
  }

  # RANGE A
  if $tcp_rangeA_src1 != false {
    firewall { '015 allow internal netA TCP range':
      dport    => $tcp_rangeA_ports,
      proto    => 'tcp',
      source   => $tcp_rangeA_src1,
      action   => 'accept',
      provider => 'iptables',
    }
  }
  if $tcp_rangeA_src2 != false {
    firewall { '016 allow internal netA TCP range':
      dport    => $tcp_rangeA_ports,
      proto    => 'tcp',
      source   => $tcp_rangeA_src2,
      action   => 'accept',
      provider => 'iptables',
    }
  }
  if $tcp_rangeA_src3 != false {
    firewall { '017 allow internal netA TCP range':
      dport    => $tcp_rangeA_ports,
      proto    => 'tcp',
      source   => $tcp_rangeA_src3,
      action   => 'accept',
      provider => 'iptables',
    }
  }

  # RANGE B
  firewall { '025 allow internal netA TCP rangeB':
    dport    => $tcp_rangeB,
    proto    => 'tcp',
    source   => $internal_netA,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '026 allow internal netB TCP rangeB':
    dport    => $tcp_rangeB,
    proto    => 'tcp',
    source   => $internal_netB,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '027 allow internal netC TCP rangeB':
    dport    => $tcp_rangeB,
    proto    => 'tcp',
    source   => $internal_netC,
    action   => 'accept',
    provider => 'iptables',
  }

  # RANGE C
  firewall { '035 allow internal netA TCP rangeC':
    dport    => $tcp_rangeC,
    proto    => 'tcp',
    source   => $internal_netA,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '036 allow internal netB TCP rangeC':
    dport    => $tcp_rangeC,
    proto    => 'tcp',
    source   => $internal_netB,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '037 allow internal netC TCP rangeC':
    dport    => $tcp_rangeC,
    proto    => 'tcp',
    source   => $internal_netC,
    action   => 'accept',
    provider => 'iptables',
  }

  # UDP rules
  firewall { '020 allow internal netA UDP':
    dport    => $udp_ports,
    proto    => 'udp',
    source   => $internal_netA,
    action   => 'accept',
    provider => 'iptables',
  }
  firewall { '021 allow internal netB UDP':
    dport    => $udp_ports,
    proto    => 'udp',
    source   => $internal_netB,
    action   => 'accept',
    provider => 'iptables',
    }
  firewall { '022 allow internal netC UDP':
    dport    => $udp_ports,
    proto    => 'udp',
    source   => $internal_netC,
    action   => 'accept',
    provider => 'iptables',
  }

}
