class webhost::php74 {


  # PHP 7.4
  class { '::php::globals':
    php_version => '7.4',
    config_root => '/etc/php/7.4',
  }->class { '::php':
    manage_repos => true,
    fpm          => true,
    composer     => true,
    phpunit      => true,
    pear         => true,
  }

  php::fpm::pool { 'www':
      request_slowlog_timeout => 3,
  }

}
