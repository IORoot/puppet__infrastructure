class profile::zsh{

  package { [
      'zsh'
    ]:
    ensure => installed,
  }
  
  user { "root":
    shell  => "/bin/zsh",
  }

}
