# set lets
$worker  = 2
$timeout = 30
$current_dir = "/var/www/rails/comicomu/current"
$shared_dir = "/var/www/rails/comicomu/shared"
$listen  = File.expand_path 'tmp/sockets/unicorn.sock', $shared_dir
$pid     = File.expand_path 'tmp/pids/unicorn.pid', $shared_dir
$std_log = File.expand_path 'log/unicorn.log', $app_dir
# set config
worker_processes  $worker
working_directory $current_dir
stderr_path $std_log
stdout_path $std_log
timeout $timeout
listen  $listen
pid $pid
# loading booster
preload_app true
# before starting processes
before_fork do |server, worker|
  ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', working_directory)
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end
# after finishing processes
after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
