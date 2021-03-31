class webhost::apache {

  # name of the node.
  $domain = $facts['networking']['fqdn']

  file { [ '/var/www/vhosts' ]:
    ensure  => directory,
  }

  # Apache modules to install.
  class { 'apache':
      timeout => 900,
  }
  class { 'apache::mod::headers': }
  class { 'apache::mod::ssl': }
  class { 'apache::mod::proxy': }
  class { 'apache::mod::proxy_fcgi': }
  class { 'apache::mod::proxy_http': }
  class { 'apache::mod::status': }
  class { 'apache::mod::rewrite': }


  # Apache - create vHost based off node name.
  # HTTP
  apache::vhost { $domain :
    servername                   => $domain,
    port                         => '80',
    docroot                      => "/var/www/vhosts/${domain}",
    override                     => 'all',
    custom_fragment              => "ProxyPassMatch ^/(.*\\.php(/.*)?)$ fcgi://127.0.0.1:9000/var/www/vhosts/${$domain}/${1}",
  }


  apache::vhost { "${domain}-ssl":
    servername                   => $domain,
    port                         => '443',
    docroot                      => "/var/www/vhosts/${domain}",
    ssl                          => true,
    override                     => 'all',
    custom_fragment              => "ProxyPassMatch ^/(.*\\.php(/.*)?)$ fcgi://127.0.0.1:9000/var/www/vhosts/${$domain}/${1}",
    ssl_cert                     => "/var/www/vhosts/${$domain}/certs/${$domain}.crt",
    ssl_key                      => "/var/www/vhosts/${$domain}/certs/${$domain}.key",
  }



}
