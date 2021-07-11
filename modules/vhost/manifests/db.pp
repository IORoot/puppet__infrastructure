  # Manage an individual database
  define vhost::db($dbname, $dbuser, $dbpass) {

    exec { "create-${dbname}-db":
      unless  => "/usr/bin/mysql ${dbname}",
      command => "/usr/bin/mysql -e \"create database ${dbname};\"",
      require => [ Service['mysql'] ],
    }

    exec { "create-${dbname}-user":
      unless  => "/usr/bin/mysql ${dbname} -e 'show grants for ${dbuser}@localhost;'",
      command => "/usr/bin/mysql -e \"create user ${dbuser}@localhost identified by '${dbpass}';\"",
      require => [ Service['mysql'] ],
    }

    exec { "grant-${dbname}-user":
      unless  => "/usr/bin/mysql ${dbname} -e 'show grants for ${dbuser}@localhost;'",
      command => "/usr/bin/mysql -e \"grant all on ${dbname}.* to ${dbuser}@localhost;\"",
      require => [ Service['mysql'] ],
    }

  }
