class profile::common {

  # Install ZSH
  class { 'zsh':
    package => true,
  }
  
  # Install my ZSH git repo
  include andyp::zsh_profile

}
