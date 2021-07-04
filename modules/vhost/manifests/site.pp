# Deploy a particular site
define vhost::site(
                      $wordpress=false,
                      ) {

  # ┌────────────────────────────────────────────────────────┐
  # │                     Set site_name                      │
  # └────────────────────────────────────────────────────────┘
  $site_name = $name
  $site_root = '/var/www/vhosts'

  # ┌────────────────────────────────────────────────────────┐
  # │  /usr/local/bin/sitedir_$name                          │
  # └────────────────────────────────────────────────────────┘  
  file { "/usr/local/bin/sitedir_${site_name}":
    content => "#!/bin/sh\necho ${site_root}/${site_name}",
    mode    => '0755',
  }



}
