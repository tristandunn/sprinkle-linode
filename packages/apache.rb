SITES_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'apache', 'sites'))

package :apache do
  describe 'Apache web server'
  apt 'apache2-mpm-prefork apache2-prefork-dev libapr1-dev' do
    post :install, 'a2enmod expires',
                   'a2enmod headers',
                   'a2enmod rewrite',
                   'a2dissite default',
                   'rm -fr /var/www/apache2-default',
                   'sed -i "s|^ServerSignature On$|ServerSignature Off|" /etc/apache2/apache2.conf',
                   'sed -i "s|^ServerTokens Full$|ServerTokens Prod|" /etc/apache2/apache2.conf'

    Dir["#{SITES_PATH}/*"].each do |site|
      name = File.basename(site)

      File.open(site) do |file|
        while line = file.gets
          post :install, "echo \"#{line}\" >> /etc/apache2/sites-available/#{name}"
        end
      end

      post :install, "a2ensite #{name}"
    end

    post :install, '/etc/init.d/apache2 restart'
  end

  verify do
    has_process 'apache2'
  end
end