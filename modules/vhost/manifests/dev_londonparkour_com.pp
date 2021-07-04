# dev.londonparkour.com
class vhost::dev_londonparkour_com {

  webhost::site { 'dev.londonparkour.com':
    wordpress         => true,
  }

}
