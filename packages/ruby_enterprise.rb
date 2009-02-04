package :ruby_enterprise do
  description 'Ruby enterprise edition'
  requires :passenger
  version '1.8.6-20090201'
  source "http://rubyforge.org/frs/download.php/51100/ruby-enterprise-#{version}.tar.gz" do
    custom_install 'echo -en "\n\n\n\n" | ./installer'

    post :install, "sed -i \"s|^PassengerRuby [/a-zA-Z0-9.]*$|PassengerRuby /opt/ruby-enterprise-1.8.6-20090201/bin/ruby|\" /etc/apache2/extras/passenger.conf",
                   '/etc/init.d/apache2 restart'
  end

  verify do
    has_directory  "/opt/ruby-enterprise-1.8.6-20090201"
    has_executable "/opt/ruby-enterprise-1.8.6-20090201/bin/ruby"
  end
end