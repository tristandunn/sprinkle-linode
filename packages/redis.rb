package :redis do
  description 'Redis'
  apt 'redis-server'

  verify do
    has_process    'redis-server'
    has_executable '/usr/bin/redis-server'
  end
end
