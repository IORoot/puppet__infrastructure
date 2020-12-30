class profile::common {

  # Install ZSH
  class { 'zsh':
    package => true,
  }
  
  # Install my ZSH git repo
  include andyp::zsh_profile

  # Install ohmyzsh for users
  #ohmyzsh::install { ['root', 'vagrant']: set_sh => true }
}
