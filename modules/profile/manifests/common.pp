class profile::common {

  # Load the Puppetlabs CRON module
  include cron

  # Load the Puppetlabs Firewall module
  include firewall

  # Install ZSH
  class { 'zsh': package => true, }

  # Install ohmyzsh
  ohmyzsh::install { 'root':
    set_sh => true
  }

  # Install my ZSH git repo
  include andyp::zsh_profile

}
