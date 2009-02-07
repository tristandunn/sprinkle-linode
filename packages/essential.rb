package :build_essential do
  describe 'Build tools'
  apt 'build-essential' do
    pre :install, 'apt-get -y update',
                  'apt-get -y dist-upgrade'
  end
end