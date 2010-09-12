SITES_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'apache', 'sites'))

package :apache do
  describe 'Apache web server'
  apt 'apache2-mpm-prefork apache2-prefork-dev libapr1-dev' do
    post :install,
      'a2enmod expires',
      'a2enmod headers',
      'a2enmod rewrite',
      'a2dissite default',
      'rm -fr /var/www/*',
      'rm -fr /etc/apache2/sites-available/*',
      'cd /var/www && chown www-data:www-data . && chmod g+s .',
      'sed -i "s|^ServerSignature .*$|ServerSignature Off|" /etc/apache2/conf.d/security',
      'sed -i "s|^ServerTokens .*$|ServerTokens Prod|" /etc/apache2/conf.d/security'

    Dir["#{SITES_PATH}/*"].each do |site|
      name     = File.basename(site)
      contents = File.read(site).gsub("'", "'\\\\''")

      if contents =~ /^\s+DocumentRoot\s+(.*)$/
        post :install, "mkdir -p #{$1}"
      end

      post :install,
        "echo -e '#{contents.gsub("\n", '\n')}' | tee -a /etc/apache2/sites-available/#{name}"
        "a2ensite #{name}"
    end

    post :install, '/etc/init.d/apache2 restart'
  end

  verify do
    has_process 'apache2'
  end
end
