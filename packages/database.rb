SETUP_SQL_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'database', 'setup.sql'))

package :mysql, :provides => :database do
  describe 'MySQL database server and client'
  apt 'mysql-server mysql-client libmysqlclient15-dev' do
    if File.file?(SETUP_SQL_PATH)
      post :install,
        "mysql -u root -e '#{File.open(SETUP_SQL_PATH).read.gsub(/\n/, '')}'"
    end
  end

  verify do
    has_executable 'mysqld'
    has_executable 'mysql'
  end
end
