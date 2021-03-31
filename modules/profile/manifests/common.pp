class profile::common {

  # Load the Puppetlabs CRON module
  include cron

  # Load the Puppetlabs Firewall module
  include firewall

  # Install ZSH
  class { 'zsh': package => true, }

  class { 'ohmyzsh': }

  # Install my ZSH git repo
  include andyp::zsh_profile

  # $directory        = '/root/.oh-my-zsh'
  # $directory_exists = find_file($directory)

  # if $directory_exists { } else {

  #   # Install oh-my-zsh
  #   exec { 'install_oh_my_zsh':
  #     command => '/usr/bin/sh -c "$(/usr/bin/wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"'
  #   }

  # }

}
