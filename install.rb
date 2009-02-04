require 'packages/database'
require 'packages/essential'

policy :linode, :roles => :app do
  requires :build_essential
  requires :database
end

deployment do
  delivery :capistrano

  source do
    prefix   '/usr/local'
    archives '/usr/local/sources'
    builds   '/usr/local/build'
  end
end