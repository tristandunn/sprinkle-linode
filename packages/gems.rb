package :gems do
  description 'Gems for Ruby'

  gem 'memcache-client mysql rails'

  requires :ruby, :memcached

  verify do
    ruby_can_load 'memcache'
    ruby_can_load 'mysql'
  end
end
