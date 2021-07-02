class profile::scripts__tools {

  # Version Control System REPO - Download Repo
  #
  # Add my ZSH repo
  vcsrepo { '/root/scripts__tools':
    ensure   => present,
    provider => git,
    source   => 'https://github.com/IORoot/scripts__tools.git',
  }

  # Delete default .zshrc - test not a symbolic link (-h)
  exec { 'remove_default_zshrc':
      command => '/bin/mv /root/.zshrc /root/.zshrc.old; ',
      onlyif  => '/usr/bin/test ! -h /root/.zshrc',
  }

  # Delete default and replace with mine.
  exec { 'new_zshrc':
      command => '/usr/bin/ln -s /root/zsh/.zshrc /root/.zshrc',
      onlyif  => ['/usr/bin/test -d /root/zsh', '/usr/bin/test ! -f /root/.zshrc'],
  }


}
