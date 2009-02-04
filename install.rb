require 'packages/database'
require 'packages/essential'
require 'packages/memcached'
require 'packages/scm'

policy :linode, :roles => :app do
  requires :build_essential
  requires :database
  requires :memcached
  requires :scm
end

deployment do
  delivery :capistrano

  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end