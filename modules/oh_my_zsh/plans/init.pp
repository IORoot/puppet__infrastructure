plan oh_my_zsh (
  TargetSpec $targets,
) {
  run_command('sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"', $targets)
}
