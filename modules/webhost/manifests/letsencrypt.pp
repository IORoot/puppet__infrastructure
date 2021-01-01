class webhost::letsencrypt {

  # Node Domain
  $domain   = $facts['networking']['fqdn']

  # Enable LetsEncrypt
  class { 'letsencrypt':
    email  => 'andy@londonparkour.com',
  }



  letsencrypt::certonly { $domain:
    domains         => [$domain],
    plugin          => 'webroot',
    webroot_paths   => ["/var/www/vhosts/${$domain}"],
    additional_args => ['--test-cert'],

    # Make sure the Apache service is running.
    require         => Service[httpd],
  }

}
