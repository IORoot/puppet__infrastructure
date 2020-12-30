plan oh_my_zsh::install_zsh (
  TargetSpec $targets,
) {
  apply_prep($targets)

  apply($targets) {
    package { 'zsh':
      ensure => installed,
    }
  }
}
