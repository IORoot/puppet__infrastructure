class webhost::letsencrypt {

  # LetsEncrypt
  class { 'letsencrypt':
    email => 'andy@londonparkour.com',
  }

}
