class webhost::mysql {

  # Node Domain
  $domain   = $facts['networking']['fqdn']

  # Get from common.yaml
  $username = lookup('mysql::username')
  $password = lookup('mysql::password')

  # MySQL
  include ::mysql::server

}
