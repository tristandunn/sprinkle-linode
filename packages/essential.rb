package :build_essential do
  describe 'Build tools'
  apt 'build-essential zlib1g-dev libssl-dev libreadline5-dev' do
    pre :install, 'apt-get -y update',
                  'apt-get -y dist-upgrade'
  end
end
