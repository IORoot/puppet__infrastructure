class qa::lighthouse {


  class { 'nodejs':
      repo_url_suffix => '15.x',
  }

  package { 'lighthouse':
    ensure   => '7.3.0',
    provider => 'npm',
  }

  # /bin/google-chrome
  class { 'google_chrome': }

  file { '/var/www/sites/qa/lighthouse':
    ensure => directory,
    owner  => 'deploy',
    group  => 'deploy',
    mode   => '0644',
  }

  file { '/usr/local/bin/qa_lighthouse':
    source => 'puppet:///modules/qa/qa_lighthouse.sh',
    mode   => '0755',
  }

}
