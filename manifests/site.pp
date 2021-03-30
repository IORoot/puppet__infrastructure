node 'default' {
}

node 'dev.londonparkour.com' {
  include role::webserver
  include role::vagrant
}

node 'dev.labs.londonparkour.com' {
  include role::webserver
  include role::vagrant
}

node 'dev.pulse.londonparkour.com' {
  include role::webserver
  include role::vagrant
}

node 'devops01' {
  include role::webserver
  include role::qa
}
