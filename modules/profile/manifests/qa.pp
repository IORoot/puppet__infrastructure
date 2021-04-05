# Governized web server
class profile::qa {

  include nodejs
  include qa
  include qa::lighthouse
  include qa::muffet
  include qa::pa11y
}
