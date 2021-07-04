# dev.londonparkour.com
class webhost::dev_labs_londonparkour_com {

  webhost::site { 'dev.labs.londonparkour.com':
    wordpress         => true,
  }

}
