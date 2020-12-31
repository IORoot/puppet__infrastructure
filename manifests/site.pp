node 'default' {
}

node 'dev.labs.londonparkour.com' {
  include role::webserver


  apache::vhost { 'dev.labs.londonparkour.com':
    port          => '80',
    docroot       => '/var/www/vhosts/dev.labs.londonparkour.com',
  }
  
}
