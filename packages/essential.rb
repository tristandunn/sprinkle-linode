package :build_essential do
  describe 'Build tools'
  apt 'build-essential zlib1g-dev libssl-dev libreadline5-dev' do
    pre :install, "echo 'deb http://ftp.debian.org/debian experimental main' >> /etc/apt/sources.list"
    pre :install, 'apt-get -y update',
                  'apt-get -y dist-upgrade'
  end
end
