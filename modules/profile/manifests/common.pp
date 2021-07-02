class profile::common {

  # Load the Puppetlabs CRON module
  include cron

  # Load the Puppetlabs Firewall module
  include firewall

  # Install ZSH
  include profile::zsh

  include profile::ohmyzsh

  # Install my ZSH setup
  # include andyp::zsh_profile

}
