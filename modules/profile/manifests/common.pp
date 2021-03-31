class profile::common {

  # Load the Puppetlabs CRON module
  include cron

  # Load the Puppetlabs Firewall module
  include firewall

  # Install ZSH
  class { 'zsh': package => true, }

  # oh-myzsh is through YAML

  # Install my ZSH setup
  include andyp::zsh_profile

}
