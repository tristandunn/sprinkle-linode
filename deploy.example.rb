# SSH in as 'root'. Probably not the best idea.
set :user, 'root'

# Just run the commands since we are 'root'.
set :run_method, :run

# Be sure to fill in your server host name or IP.
role :app, 'your-host-name-or-ip'
