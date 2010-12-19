package :ruby do
  description 'Ruby Virtual Machine'
  version '1.9.2'
  patchlevel '0'
  source "ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-#{version}-p#{patchlevel}.tar.gz"
  requires :ruby_dependencies

  verify do
    has_executable 'ruby'
  end
end

package :ruby_dependencies do
  description 'Ruby Virtual Machine Build Dependencies'
  apt %w(zlib1g-dev libssl-dev libreadline5-dev libncurses5-dev file)
end

package :rubygems do
  description 'Ruby Gems Package Management System'
  version '1.3.7'
  source "http://production.cf.rubygems.org/rubygems/rubygems-#{version}.tgz" do
    custom_install 'ruby setup.rb'
  end

  requires :ruby

  verify do
    ruby_can_load 'rubygems'
  end
end
