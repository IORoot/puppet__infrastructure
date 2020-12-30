# == Class: zsh::params
#
# This is a container class holding default parameters for zsh module.
#
class zsh::params {
  case $::operatingsystem {
    /(?i:debian|devuan|ubuntu)/: {
      $zsh_package_name = 'zsh'
      $zsh_config       = '/root/.zshrc'
    }
    /(?i:centos|fedora|redhat)/: {
      $zsh_package_name = 'zsh'
      $zsh_config       = '/root/.zshrc'
    }
    default                    : {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
# EOF
