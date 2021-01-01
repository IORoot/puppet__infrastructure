class webhost::self_signed_cert {

  # RootCA Password
  # Passed in to create certificate.
  $root_pass = lookup('rootCA::password')

  # This is the node name.
  $domain    = $facts['networking']['fqdn']

  # Place in the webhost directory
  $directory        = "/var/www/vhosts/${domain}/certs"
  $directory_exists = find_file($directory)

  # rootCA Files.
  $root_crt = '/etc/puppetlabs/code/environments/production/modules/webhost/files/rootCA/rootCA.crt'
  $root_key = '/etc/puppetlabs/code/environments/production/modules/webhost/files/rootCA/rootCA.key'


  if $directory_exists {

    notify {'path_exists':
      message => "Directory ${$directory} already exists. Remove to get new cert."
    }

  } else {

    notify {'new_cert':
      message => "Obtaining new certificate. Placing certs in : ${$directory}"
    }

    # Create the Certifcate Authority Directory.
    exec{'make_certs_directory':
      command => "/usr/bin/mkdir ${$directory};",
    }

    # Create Domain CSR
    exec{'domain_csr':
      command => "/opt/puppetlabs/puppet/bin/openssl req -new -nodes -keyout ${$directory}/${$domain}.key -out ${$directory}/domain.csr -days 3650 -subj \"/C=CA/L=ON/O=TD/CN=${$domain}\"",
      require => Exec['make_certs_directory'],
    }

    # Create External SubjectAltName file. 
    exec{'external_file':
      command => "/usr/bin/echo '[ v3_ca ]\nsubjectAltName = DNS:${$domain}' > ${$directory}/v3_ca.file",
      require => Exec['domain_csr'],
    }

    # Create SSL Certificate using the rootCA files 
    # located in the /webhost/files/rootCA/ folder
    # rootCA.crt
    # rootCA.key
    exec{'ssl_certificate':
      command => "/opt/puppetlabs/puppet/bin/openssl x509 -req -days 3650 -sha256 \
                  -in ${$directory}/domain.csr \
                  -CA ${$root_crt} \
                  -CAkey ${$root_key} \
                  -CAcreateserial \
                  -passin pass:${$root_pass} \
                  -out ${$directory}/${$domain}.crt \
                  -extensions v3_ca \
                  -extfile ${$directory}/v3_ca.file",
      require => Exec['domain_csr'],
    }


    # Cleanup
    exec{'cleanup':
      command => "/usr/bin/rm ${$directory}/v3_ca.file; /usr/bin/rm ${$directory}/domain.csr",
      require => Exec['ssl_certificate'],
    }

  }




}



