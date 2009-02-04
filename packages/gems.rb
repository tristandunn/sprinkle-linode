package :gems do
  description 'Gems for Ruby'
  gem 'memcache-client mysql'
  requires :rubygems

  verify do
    has_gem 'memcache-client'
    has_gem 'mysql'
  end
end