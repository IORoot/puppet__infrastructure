class qa {

  file { [ '/var/www/sites',
          '/var/www/sites/qa',]:
    ensure  => directory,
  }

  apache::vhost { 'qa-default':
    port          => '80',
    priority      => '10',
    servername    => 'default',
    serveraliases => '*',
    docroot       => '/var/www/sites/qa',
  }

  file { '/usr/local/bin/qa':
    source => 'puppet:///modules/qa/qa.sh',
    mode   => '0755',
  }

}
