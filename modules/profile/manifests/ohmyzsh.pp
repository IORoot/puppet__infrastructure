class profile::ohmyzsh{

  exec { 'whereami':
    command => '/usr/bin/echo /usr/bin/pwd; /bin/whoami > /tmp/info;'
  }

  # Delete default .zshrc - test not a symbolic link (-h)
  exec { 'download_ohmyzsh':
      command => '/usr/bin/wget -O ~/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)',
      onlyif  => '/usr/bin/test ! -d ~/.oh-my-zsh',
  }

  # Install
  exec { 'install_ohmyzsh':
      command => '/bin/sh ~/install.sh',
      onlyif  => '/usr/bin/test ! -d ~/.oh-my-zsh',
  }

}
