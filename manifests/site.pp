node 'default' {
}

node 'dev.londonparkour.com' {
  include role::webserver
  include role::vagrant
  include role::qa
  include vhost::dev_londonparkour_com
}

node 'dev.labs.londonparkour.com' {
  include role::webserver
  include role::vagrant
  include vhost::dev_labs_londonparkour_com
}

node 'dev.pulse.londonparkour.com' {
  include role::webserver
  include role::vagrant
  include vhost::dev_pulse_londonparkour_com
}
