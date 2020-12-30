class andyp::zsh_profile {
   
  # Version Control System REPO - Download Repo
  #
  # Add my ZSH repo
  vcsrepo { '/root/zsh':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/IORoot/zsh.git',
  }

  # Delete default .zshrc
  exec { 'remove_default_zshrc':
      command => '/bin/rm /root/.zshrc; ',
      onlyif  => '/usr/bin/test ! -h /root/.zshrc',
  }

  # Delete default and replace with mine.
  exec { 'new_zshrc':
      command => '/usr/bin/ln -s /root/zsh/.puppet.zshrc /root/.zshrc',
      onlyif  => ['/usr/bin/test -d /root/zsh', '/usr/bin/test ! -f /root/.zshrc'],
  }
 
  # Install Powerline10k
  exec { 'powerline10k':
      command => '/usr/bin/git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k',
      onlyif  => '/usr/bin/test ! -d /root/.oh-my-zsh/custom/themes/powerlevel10k/',
  }


  # Install ZSH-Autosuggestion
  exec { 'zsh-autosuggestion':
      command => '/usr/bin/git clone https://github.com/zsh-users/zsh-autosuggestions /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions',
      onlyif  => '/usr/bin/test ! -d /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions',
  }
}
