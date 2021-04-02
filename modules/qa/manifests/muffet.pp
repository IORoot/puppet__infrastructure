class qa::muffet {

  file { '/var/www/sites/qa/broken-links':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/usr/local/bin/muffet':
    source => 'puppet:///modules/qa/muffet',
    mode   => '0755',
  }

  file { '/usr/local/bin/qa_brokenlinks':
    source => 'puppet:///modules/qa/qa_brokenlinks.sh',
    mode   => '0755',
  }
}
