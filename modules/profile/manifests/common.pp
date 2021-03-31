class profile::common {

  # Load the Puppetlabs CRON module
  include cron

  # Load the Puppetlabs Firewall module
  include firewall

  # Install ZSH
  class { 'zsh': package => true, }

  # oh-myzsh is through YAML
  ohmyzsh::install { ['root']: set_sh => true }
  ohmyzsh::plugins { 'root': plugins =>
    [
      'zsh-autosuggestions'          => [
        'ensure'= latest,
        'source'= git,
        'url   '= 'https://github.com/zsh-users/zsh-autosuggestions.git',
      ]
    ]
  }

  # Install my ZSH setup
  include andyp::zsh_profile

}
