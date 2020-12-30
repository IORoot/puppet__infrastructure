class andyp::zsh_profile {

    
  # Version Control System REPO - Download Repo
  #
  # Add my ZSH repo
  vcsrepo { '~/':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/IORoot/zsh.git',
  }

  # Symlink
  file { '~/.zshrc':
    ensure => 'link',
    target => '~/zsh/.vagrant.zshrc',
  }
  
}
