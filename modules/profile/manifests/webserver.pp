class profile::webserver {

  # MySQL
  include ::mysql::server

  # Apache
  include apache

  # PHP 7.4
  class { ::php::globals:
    php_version => '7.4',
    config_root => '/etc/php/7.4',
  }->
  class { '::php':
    manage_repos => true
  }

  # LetsEncrypt
  class { letsencrypt:
    email => 'foo@example.com',
  }
}