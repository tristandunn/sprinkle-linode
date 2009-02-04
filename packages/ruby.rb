package :ruby do
  description 'Ruby virtual machine'
  version '1.8.6'
  apt 'ruby1.8-dev ruby1.8 ri1.8 rdoc1.8 irb1.8 libreadline-ruby1.8 libruby1.8 libopenssl-ruby' do
    post :install, 'ln -s /usr/bin/ruby1.8 /usr/bin/ruby',
                   'ln -s /usr/bin/ri1.8 /usr/bin/ri',
                   'ln -s /usr/bin/rdoc1.8 /usr/bin/rdoc',
                   'ln -s /usr/bin/irb1.8 /usr/bin/irb'
  end

  verify do
    has_file    '/usr/bin/ruby1.8'
    has_file    '/usr/bin/ri1.8'
    has_file    '/usr/bin/rdoc1.8'
    has_file    '/usr/bin/irb1.8'
    has_symlink '/usr/bin/ruby', '/usr/bin/ruby1.8'
    has_symlink '/usr/bin/ri',   '/usr/bin/ri1.8'
    has_symlink '/usr/bin/rdoc', '/usr/bin/rdoc1.8'
    has_symlink '/usr/bin/irb',  '/usr/bin/irb1.8'
  end
end