# dev.londonparkour.com
class vhost::dev_labs_londonparkour_com {

  vhost::site { 'dev.labs.londonparkour.com':
    wordpress         => true,
  }

}
