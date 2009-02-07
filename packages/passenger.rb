package :passenger do
  description 'Passenger (mod_rails) Apache extension'
  requires :apache, :passenger_dependencies, :rubygems
  version '2.0.6'
  gem 'passenger' do
    post :install, 'echo -en "\n\n\n\n" | passenger-install-apache2-module',
                   'mkdir -p /etc/apache2/extras',
                   'touch /etc/apache2/extras/passenger.conf',
                   "echo 'Include /etc/apache2/extras/passenger.conf' >> /etc/apache2/apache2.conf"

    ["LoadModule passenger_module /usr/lib/ruby/gems/1.8/gems/passenger-#{version}/ext/apache2/mod_passenger.so",
     "PassengerRoot /usr/lib/ruby/gems/1.8/gems/passenger-#{version}",
     "PassengerRuby /usr/bin/ruby1.8"].each do |line|
      post :install, "echo '#{line}' >> /etc/apache2/extras/passenger.conf"
    end

    post :install, '/etc/init.d/apache2 restart'
  end

  verify do
    has_file      '/etc/apache2/extras/passenger.conf'
    has_file      "/usr/lib/ruby/gems/1.8/gems/passenger-#{version}/ext/apache2/mod_passenger.so"
    has_directory "/usr/lib/ruby/gems/1.8/gems/passenger-#{version}"
  end
end

package :passenger_dependencies do
  description 'Passenger build dependencies'
  apt 'libreadline5-dev'
end