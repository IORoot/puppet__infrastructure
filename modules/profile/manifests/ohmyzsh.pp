class profile::ohmyzsh{

  # Delete default .zshrc - test not a symbolic link (-h)
  exec { 'download_ohmyzsh':
      command => '/usr/bin/sudo /usr/bin/wget -O /root/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh',
      onlyif  => '/usr/bin/test ! -d /root/.oh-my-zsh',
  }

  # Install and delete
  exec { 'install_ohmyzsh':
      command => '/usr/bin/sudo /bin/sh /root/install.sh; /bin/rm /root/install.sh;',
      onlyif  => '/usr/bin/test -f /root/install.sh',
  }

  # Install Powerline10k Theme
  exec { 'powerline10k':
      command => '/usr/bin/git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k',
      onlyif  => '/usr/bin/test ! -d /root/.oh-my-zsh/custom/themes/powerlevel10k/',
  }

  # Install zsh-autosuggestions plugin
  exec { 'zsh_autosuggestions':
      command => '/usr/bin/git clone https://github.com/zsh-users/zsh-autosuggestions.git /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions',
      onlyif  => '/usr/bin/test ! -d /root/.oh-my-zsh/custom/plugins/zsh-autosuggestions/',
  }
  # Install zsh-syntax-highlighting plugin
  exec { 'zsh_syntax_highlighting':
      command => '/usr/bin/git clone https://github.com/zsh-users/zsh-syntax-highlighting.git /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting',
      onlyif  => '/usr/bin/test ! -d /root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/',
  }

}
