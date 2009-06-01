package :gems do
  description 'Gems for Ruby'

  gem 'memcache-client mysql'

  requires :ruby_enterprise

  verify do
    ruby_can_load 'memcache'
    ruby_can_load 'mysql'
  end
end