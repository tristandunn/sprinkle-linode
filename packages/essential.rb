package :build_essential do
  describe 'Build tools'
  apt 'build-essential' do
    pre :install, 'apt-get update',
                  'apt-get dist-upgrade'
  end
end