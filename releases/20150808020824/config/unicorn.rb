# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/tcntd"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/var/www/tcntd/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/tcntd/log/unicorn.log"
stdout_path "/var/www/tcntd/log/unicorn.log"

# Unicorn socket
listen "/var/run/unicorn.[tcntd].sock"
listen "/var/run/unicorn.tcntd.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
