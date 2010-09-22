require 'packages/apache'
require 'packages/database'
require 'packages/essential'
require 'packages/gems'
require 'packages/monit'
require 'packages/passenger'
require 'packages/ruby'
require 'packages/scm'

policy :linode, :roles => :app do
  requires :build_essential
  requires :apache
  requires :database
  requires :gems
  requires :monit
  requires :passenger
  requires :ruby
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
