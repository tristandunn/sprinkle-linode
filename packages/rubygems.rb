package :rubygems do
  description 'Package management system for Ruby'
  requires :ruby
  version '1.3.1'
  source "http://rubyforge.org/frs/download.php/45905/rubygems-#{version}.tgz" do
    custom_install 'ruby setup.rb'

    post :install, 'ln -s /usr/bin/gem1.8 /usr/bin/gem',
                   'gem update --system'
  end

  verify do
    has_file    '/usr/bin/gem1.8'
    has_symlink '/usr/bin/gem', '/usr/bin/gem1.8'
  end
end