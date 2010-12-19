package :gems do
  description 'Gems for Ruby'

  gem 'bundler'

  requires :ruby

  verify do
    ruby_can_load 'bundler'
  end
end
