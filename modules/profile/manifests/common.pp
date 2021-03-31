class profile::common {

  # Load the Puppetlabs CRON module
  include cron

  # Load the Puppetlabs Firewall module
  include firewall

  # Install ZSH
  class { 'zsh': package => true, }

  # oh-myzsh is through YAML
  ohmyzsh::install { ['root']: set_sh => true }


  # Install my ZSH setup
  include andyp::zsh_profile

}
