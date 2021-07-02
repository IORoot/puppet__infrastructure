class profile::ohmyzsh{

  # Delete default .zshrc - test not a symbolic link (-h)
  exec { 'install_ohmyzsh':
      command => '/bin/cd ~; /usr/bin/echo /usr/bin/pwd; /usr/bin/sh -c "$(/usr/bin/wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"',
      onlyif  => '/usr/bin/test ! -d ~/.oh-my-zsh',
  }
}
