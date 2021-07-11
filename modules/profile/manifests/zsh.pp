class profile::zsh{

  package { [
      'zsh'
    ]:
    ensure => installed,
  }


  # Delete default .zshrc - test not a symbolic link (-h)
  # exec { 'download_ohmyzsh':
  #     command => 'chsh -s /usr/bin/zsh',
  #     onlyif  => '/usr/bin/test ! -d /root/.oh-my-zsh',
  # }
  
  user { "root":
    shell  => "/bin/zsh",
  }

}
