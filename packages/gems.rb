package :gems do
  description 'Gems for Ruby'

  gem 'SystemTimer mysql rails redis'

  requires :ruby, :redis

  verify do
    ruby_can_load 'redis'
    ruby_can_load 'mysql'
    ruby_can_load 'system_timer'
  end
end
