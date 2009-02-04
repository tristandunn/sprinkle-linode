set  :user,       'root'                  # SSH in as 'root'. Probably not the best idea.
set  :run_method, :run                    # Just run the commands since we are 'root'.
role :app,        'your-host-name-or-ip'  # Be sure to fill in your server host name or IP.