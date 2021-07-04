class profile::webserver {

  include ::webhost::firewall

  include ::webhost::mysql

  include ::webhost::apache

  include ::webhost::php74

}
