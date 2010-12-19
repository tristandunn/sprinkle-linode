package :gems do
  description 'Gems for Ruby'

  gem 'bundler pg'

  requires :ruby

  verify do
    ruby_can_load 'bundler'
    ruby_can_load 'pg'
  end
end
