class profile::common {

    package { [
      'sudo',
      'git',
      'lsof',
      'zsh'
    ]:
    ensure => installed,
  }

  include cron
  include firewall
  include profile::ohmyzsh
  include profile::scripts__tools

}
