class webhost::mysql {

  # Node Domain
  $domain   = $facts['networking']['fqdn']

  # Get from common.yaml
  $username = lookup('mysql::username')
  $password = lookup('mysql::password')

  # MySQL
  include ::mysql::server

  # Create a database called $domain (dev.londonparkour.com)
  # mysql::db { $domain:
  #   user     => $username,
  #   password => $password,
  #   host     => 'localhost',
  #   dbname   => $domain,
  #   grant    => ['ALL'],
  # }

}
