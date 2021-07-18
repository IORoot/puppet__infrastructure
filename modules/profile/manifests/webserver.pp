class profile::webserver {

  include ::webhost::firewall

  include ::webhost::apache

  include ::webhost::mysql

  include ::webhost::php74

  include ::webhost::letsencrypt

}
