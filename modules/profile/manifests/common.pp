class profile::common {

  # APT-Get Update
  exec { 'aptUpdate':
      command => '/usr/bin/add-apt-repository universe && /usr/bin/apt-get update',
  }
  
  package { 
    [
      'sudo',
      'git',
      'lsof'
    ]:
    ensure => installed,
  }


  include cron
  include firewall
  include profile::zsh
  include profile::ohmyzsh
  include profile::scripts__tools
  include profile::puppet

}
