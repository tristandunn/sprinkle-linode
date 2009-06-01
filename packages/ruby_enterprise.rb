package :ruby_enterprise do
  description 'Ruby enterprise edition'
  version '1.8.6-20090520'
  source "http://rubyforge.org/frs/download.php/57097/ruby-enterprise-#{version}.tar.gz" do
    custom_install 'echo -en "\n\n\n\n" | ./installer'

    post :install, 'ln -s /opt/ruby-enterprise-1.8.6-20090520/bin/ruby /usr/bin/ruby',
                   'ln -s /opt/ruby-enterprise-1.8.6-20090520/bin/ri /usr/bin/ri',
                   'ln -s /opt/ruby-enterprise-1.8.6-20090520/bin/rdoc /usr/bin/rdoc',
                   'ln -s /opt/ruby-enterprise-1.8.6-20090520/bin/irb /usr/bin/irb',
                   'ln -s /opt/ruby-enterprise-1.8.6-20090520/bin/gem /usr/bin/gem',
                   'gem update --system',
                   'gem sources -a http://gems.github.com'
  end

  verify do
    has_symlink '/usr/bin/ruby', '/opt/ruby-enterprise-1.8.6-20090520/bin/ruby'
    has_symlink '/usr/bin/ri',   '/opt/ruby-enterprise-1.8.6-20090520/bin/ri'
    has_symlink '/usr/bin/rdoc', '/opt/ruby-enterprise-1.8.6-20090520/bin/rdoc'
    has_symlink '/usr/bin/irb',  '/opt/ruby-enterprise-1.8.6-20090520/bin/irb'
    has_symlink '/usr/bin/gem',  '/opt/ruby-enterprise-1.8.6-20090520/bin/gem'
  end
end