class profile::common {

    package { [
      'sudo',
      'git',
      'lsof',
      'man',
      'zsh'
    ]:
    ensure => installed,
  }

  include cron
  include firewall
  include profile::ohmyzsh
  include profile::scripts__tools

}
