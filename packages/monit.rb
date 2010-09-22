MONIT_CONFIG_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'monit', 'configuration'))
MONIT_SCRIPT_PATH = File.expand_path(File.join(File.dirname(__FILE__), '..', 'assets', 'monit', 'script'))

package :monit, :provides => :monitoring do
  describe 'Monitor processes, files, devices and remote systems'
  apt 'monit' do
    if File.file?(MONIT_SCRIPT_PATH) && File.file?(MONIT_CONFIG_PATH)
      config = File.open(MONIT_CONFIG_PATH).read.gsub("'", "'\\\\''").gsub("\n", '\n')
      script = File.open(MONIT_SCRIPT_PATH).read.gsub("'", "'\\\\''").gsub("\n", '\n')

      post :install,
        "echo -e '#{script}' > /etc/default/monit",
        "echo -e '#{config}' >/etc/monit/monitrc"
        "monit"
    end
  end

  verify do
    has_executable 'monit'
  end
end
