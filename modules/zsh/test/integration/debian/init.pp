# -*- puppet -*-

exec { 'apt-get update':
  command => 'apt-get update -qq',
  path    => [ '/usr/bin', '/usr/sbin', '/bin', '/sbin' ],
}

class { 'zsh':
  package => true,
  require => Exec[ 'apt-get update' ],
}
# EOF
