# dev.londonparkour.com
class vhost::dev_londonparkour_com {

  vhost::site { 'dev.londonparkour.com':
    wordpress         => true,
  }

}
