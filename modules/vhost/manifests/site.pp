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
  # │                       sitedir                          │
  # └────────────────────────────────────────────────────────┘  
  file { "/usr/local/bin/${site_name}_sitedir":
    content => "#!/bin/sh\necho ${site_root}/${site_name}",
    mode    => '0755',
  }

  # ┌────────────────────────────────────────────────────────┐
  # │                       dumpdb                           │
  # └────────────────────────────────────────────────────────┘  
  ensure_resource('file', "/usr/local/bin/${site_name}_dumpdb",
    {
      'content' => epp('vhost/dumpdb.sh.epp',
        {
          'db_name' => "db_${site_name}",
          'db_user' => lookup('mysql::username'),
          'db_pass' => lookup('mysql::password'),
          'wp_path' => "/var/www/vhosts/${site_name}",
        }
      ),
      'mode'    => '0755',
    }
  )

}
