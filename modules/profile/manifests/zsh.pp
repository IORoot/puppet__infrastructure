class profile::zsh {

    class { 'apt':
      always_apt_update => true,
    }
    # Install ZSH
    package { [
        'build-essential',
        'vim',
        'curl',
        'zsh',
        'git-core',
        'htop',
        'wget',
      ]:
      ensure  => 'installed',
    }

    # class { 'zsh': package => true }

}
