# == Class: zsh
#
# Puppet module to install, deploy and configure zsh.
#
class zsh (
  $package          = true,
  $zsh_package_name = $zsh::params::zsh_package_name,
  $zsh_config       = $zsh::params::zsh_config
) inherits zsh::params {
  case $package {
    true   : { $ensure_package = 'present' }
    false  : { $ensure_package = 'purged' }
    latest : { $ensure_package = 'latest' }
    default : { fail('package must be true, false or lastest') }
  }

  package { $zsh_package_name:
    ensure => $ensure_package,
  }

  file { $zsh_config:
    ensure  => $ensure_package,
    path    => $zsh_config,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    content => template('zsh/zshrc.erb'),
    require => Package[$zsh_package_name],
  }
}
# EOF
