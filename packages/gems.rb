package :gems do
  description 'Gems for Ruby'

  gem 'bundler mysql'

  requires :ruby

  verify do
    ruby_can_load 'bundler'
    ruby_can_load 'mysql'
  end
end
