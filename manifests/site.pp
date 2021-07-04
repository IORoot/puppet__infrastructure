node 'default' {
}

node 'dev.londonparkour.com' {
  include role::webserver
  include role::vagrant
  include role::qa
  include vhost::dev.londonparkour.com
}

node 'dev.labs.londonparkour.com' {
  include role::webserver
  include role::vagrant
}

node 'dev.pulse.londonparkour.com' {
  include role::webserver
  include role::vagrant
}
