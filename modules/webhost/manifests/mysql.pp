class webhost::mysql {

  # Node Domain
  $domain   = $facts['networking']['fqdn']

  # Get from common.yaml
  $username = lookup('mysql::username')
  $password = lookup('mysql::password')

  # MySQL
  include ::mysql::server

  # Slow Query Log
  exec { "slow-query-log":
      unless  => "/usr/bin/mysql ${dbname} -e 'show grants for ${dbuser}@localhost;'",
      command => "/usr/bin/mysql -e \"grant all on ${dbname}.* to ${dbuser}@localhost;\"",
      require => [ Service['mysql'] ],
  }

}
