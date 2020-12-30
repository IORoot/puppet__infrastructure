class andyp::zsh_profile {

    
  # Version Control System REPO - Download Repo
  #
  # Add my ZSH repo
  vcsrepo { '/root/':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/IORoot/zsh.git',
  }

  # Symlink
  file { '/root/.zshrc':
    ensure => 'link',
    target => '/root/zsh/.vagrant.zshrc',
  }
  
}
