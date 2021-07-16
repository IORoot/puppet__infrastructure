class profile::puppet {

  cron { 'run-puppet':
    ensure  => 'present',
    command => '/opt/puppetlabs/bin/puppet apply --disable_warnings deprecations /etc/puppetlabs/code/environments/production/manifests/',
    minute  => "*/${lookup('puppet::run_every', Integer)}",
    hour    => '*',
  }

  file { '/tmp/puppet.lastrun':
    content => inline_template('<%= Time.now %>'),
    backup  => false,
  }

}
