class profile::ohmyzsh{

  # Delete default .zshrc - test not a symbolic link (-h)
  exec { 'download_ohmyzsh':
      command => '/usr/bin/wget -O ~/install.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)',
      onlyif  => '/usr/bin/test ! -f ~/install.sh',
  }

  # Install
  exec { 'install_ohmyzsh':
      command => '/bin/sh ~/install.sh',
      onlyif  => '/usr/bin/test ! -f ~/install.sh',
  }

}
