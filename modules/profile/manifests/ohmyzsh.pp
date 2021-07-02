class profile::ohmyzsh{

  # Delete default .zshrc - test not a symbolic link (-h)
  exec { 'download_ohmyzsh':
      command => '/usr/bin/sudo /usr/bin/wget -O /root/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)',
      onlyif  => '/usr/bin/test ! -f /root/install.sh',
  }

  # Install
  exec { 'install_ohmyzsh':
      command => '/usr/bin/sudo /bin/sh /root/install.sh',
      onlyif  => '/usr/bin/test ! -f /root/install.sh',
  }

}
