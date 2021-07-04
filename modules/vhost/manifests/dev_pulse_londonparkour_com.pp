# dev.londonparkour.com
class vhost::dev_pulse_londonparkour_com {

  webhost::site { 'dev.pulse.londonparkour.com':
    wordpress         => true,
  }

}
