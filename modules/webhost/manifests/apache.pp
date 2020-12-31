class webhost::apache {


  # Apache
  include apache

  # Apache - create vHost based off node name.
  apache::vhost { $facts['networking']['fqdn'] :
    port    => '80',
    docroot => "/var/www/vhosts/${$facts['networking']['fqdn']}",
  }


}
