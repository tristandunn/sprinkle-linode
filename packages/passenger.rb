package :passenger do
  description 'Passenger (mod_rails) Apache extension'
  requires :apache, :ruby_enterprise
  version '2.2.4'
  gem 'passenger' do
    post :install, 'echo -en "\n\n\n\n" | /opt/ruby-enterprise-1.8.6-20090520/lib/ruby/gems/1.8/gems/passenger-2.2.4/bin/passenger-install-apache2-module',
                   'mkdir -p /etc/apache2/extras',
                   'touch /etc/apache2/extras/passenger.conf',
                   "echo 'Include /etc/apache2/extras/passenger.conf' >> /etc/apache2/apache2.conf"

    ["LoadModule passenger_module /opt/ruby-enterprise-1.8.6-20090520/lib/ruby/gems/1.8/gems/passenger-#{version}/ext/apache2/mod_passenger.so",
     "PassengerRoot /opt/ruby-enterprise-1.8.6-20090520/lib/ruby/gems/1.8/gems/passenger-#{version}",
     "PassengerRuby /opt/ruby-enterprise-1.8.6-20090520/bin/ruby"].each do |line|
      post :install, "echo '#{line}' >> /etc/apache2/extras/passenger.conf"
    end

    post :install, '/etc/init.d/apache2 restart'
  end

  verify do
    has_file '/etc/apache2/extras/passenger.conf'
    has_file "/opt/ruby-enterprise-1.8.6-20090520/lib/ruby/gems/1.8/gems/passenger-#{version}/ext/apache2/mod_passenger.so"
  end
end