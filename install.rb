require 'packages/apache'
require 'packages/database'
require 'packages/essential'
require 'packages/gems'
require 'packages/memcached'
require 'packages/passenger'
require 'packages/ruby'
require 'packages/rubygems'
require 'packages/ruby_enterprise'
require 'packages/scm'

policy :linode, :roles => :app do
  requires :apache
  requires :build_essential
  requires :database
  requires :gems
  requires :memcached
  requires :passenger
  requires :ruby
  requires :rubygems
  requires :ruby_enterprise
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