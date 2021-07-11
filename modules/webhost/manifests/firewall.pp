class webhost::firewall {

  #
  # COMMON PORTS - Check if there is a `webserver_default_ports` variable in common.yaml
  #
  if lookup('open_ports') {

    #
    # For each port defined, create a firewall rule.
    #
    lookup('open_ports', Array[Integer], 'unique').each |$port| {

      #
      # Create a firewall rule.
      #
      firewall { "Allow Inbound Traffic on Port ${port}" :
        proto  => 'tcp',
        dport  => $port,
        action => 'accept'
      }
    }

  }



}
