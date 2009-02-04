package :memcached do
  describe 'memcached distributed memory object caching system'
  apt 'memcached'

  verify do
    has_process    'memcached'
    has_executable '/usr/bin/memcached'
  end
end