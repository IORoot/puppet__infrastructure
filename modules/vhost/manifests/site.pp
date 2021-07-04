# Setup a site and all of its scripts.
define vhost::site(
  $db_name='',
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
  # │                       dbname                           │
  # └────────────────────────────────────────────────────────┘  


  # ┌────────────────────────────────────────────────────────┐
  # │                       dumpdb                           │
  # └────────────────────────────────────────────────────────┘  
  ensure_resource('file', "/usr/local/bin/${site_name}_dumpdb",
    {
      'content' => epp('vhost/dumpdb.sh.epp',
        {
          'db_name' => $db_name,
          'db_user' => lookup('mysql::username'),
          'db_pass' => lookup('mysql::password'),
          'db_path' => "/var/www/vhosts/${site_name}/wp-content/database",
        }
      ),
      'mode'    => '0755',
    }
  )

}
