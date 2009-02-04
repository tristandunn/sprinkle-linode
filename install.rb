require 'packages/database'
require 'packages/essential'
require 'packages/gems'
require 'packages/memcached'
require 'packages/ruby'
require 'packages/rubygems'
require 'packages/scm'

policy :linode, :roles => :app do
  requires :build_essential
  requires :database
  requires :gems
  requires :memcached
  requires :ruby
  requires :rubygems
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