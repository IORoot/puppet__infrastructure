# Governized web server
class profile::qa {
  include qa
  include qa::lighthouse
  include qa::muffet
  include qa::pa11y
}
