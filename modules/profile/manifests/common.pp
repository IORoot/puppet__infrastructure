class profile::common {

  include cron
  include firewall
  # include profile::zsh
  include profile::ohmyzsh

  # Install my ZSH setup
  # include andyp::zsh_profile
    package { [
      'sudo',
      'git',
      'lsof',
      'man',
      'man-pages',
      'cronie',
      'zsh'
    ]:
    ensure => installed,
  }

}
