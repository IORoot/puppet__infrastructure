class profile::common {

  # Install my ZSH setup
  # include andyp::zsh_profile
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
  # include profile::zsh
  include profile::ohmyzsh

}
