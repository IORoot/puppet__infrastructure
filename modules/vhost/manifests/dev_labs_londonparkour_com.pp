# dev.londonparkour.com
class vhost::dev_labs_londonparkour_com {

  webhost::site { 'dev.labs.londonparkour.com':
    wordpress         => true,
  }

}
