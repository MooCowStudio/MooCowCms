threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
environment ENV.fetch("RAILS_ENV") { "development" }
plugin :tmp_restart

app_dir = File.expand_path("../..", __FILE__)
puma_dir = "/tmp"
shared_dir = "#{puma_dir}/shared"

# Set up socket location
bind "unix://#{shared_dir}/sockets/puma.sock"

stdout_redirect "#{app_dir}/log/puma.stdout.log", "#{app_dir}/log/puma.stderr.log", true
