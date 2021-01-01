node 'default' {
}

node 'dev.labs.londonparkour.com' {
  include role::webserver
  include role::vagrant
}
