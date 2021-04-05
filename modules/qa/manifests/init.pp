class qa {


  class { '::nodejs':
    repo_url_suffix           => '15.x',
    manage_package_repo       => false,
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
  }

  apache::vhost { 'qa-default':
    port                => '80',
    priority            => '10',
    servername          => 'default',
    serveraliases       => '*',
    docroot             => '/var/www/sites/qa',
    add_default_charset => 'UTF-8',
  }

  file { '/var/www/sites':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/var/www/sites/qa':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  file { '/usr/local/bin/qa':
    source => 'puppet:///modules/qa/qa.sh',
    mode   => '0755',
  }

  file { '/usr/local/bin/qa_utils.sh':
    source => 'puppet:///modules/qa/qa_utils.sh',
    mode   => '0755',
  }

  file { '/usr/local/bin/sitemap_urls':
    source => 'puppet:///modules/qa/sitemap_urls.sh',
    mode   => '0755',
  }

}
