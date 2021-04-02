class qa::pa11y {

  package { 'pa11y':
    ensure   => '5.3.0',
    provider => 'npm',
  }

  file { '/var/www/sites/qa/accessibility':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/usr/local/bin/qa_pa11y':
    source => 'puppet:///modules/qa/qa_pa11y.sh',
    mode   => '0755',
  }

}
