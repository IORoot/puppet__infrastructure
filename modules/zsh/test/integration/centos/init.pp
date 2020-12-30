# -*- puppet -*-

exec { 'yum update':
  command => 'yum update -q -y',
  path    => [ '/usr/bin', '/usr/sbin', '/bin', '/sbin' ],
}

class { 'zsh':
  package => true,
  require => Exec[ 'yum update' ],
}
# EOF
