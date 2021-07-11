class profile::common {

    package { [
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

}
