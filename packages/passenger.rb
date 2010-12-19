package :passenger do
  description 'Passenger (mod_rails) Apache extension'
  requires :apache, :ruby
  version '3.0.2'
  gem 'passenger' do
    post :install,
      'passenger-install-apache2-module --auto',
      'mkdir -p /etc/apache2/extras',
      'touch /etc/apache2/extras/passenger.conf',
      "echo 'Include /etc/apache2/extras/passenger.conf' >> /etc/apache2/apache2.conf"

   ["LoadModule passenger_module /usr/local/lib/ruby/gems/1.9.1/gems/passenger-3.0.2/ext/apache2/mod_passenger.so",
    "PassengerRoot /usr/local/lib/ruby/gems/1.9.1/gems/passenger-3.0.2",
    "PassengerRuby /usr/local/bin/ruby"].each do |line|
      post :install, "echo '#{line}' >> /etc/apache2/extras/passenger.conf"
    end

    post :install, '/etc/init.d/apache2 restart'
  end

  verify do
    has_file '/etc/apache2/extras/passenger.conf'
    has_file "/usr/local/lib/ruby/gems/1.9.1/gems/passenger-#{version}/ext/apache2/mod_passenger.so"
  end
end
