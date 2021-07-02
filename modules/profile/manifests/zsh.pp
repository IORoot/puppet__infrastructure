class profile::zsh {

    # Install ZSH
    package { 'zsh':
      ensure => present
    }

    # class { 'zsh': package => true }

}
