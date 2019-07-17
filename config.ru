# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application
if ENV['RACK_ENV'] == 'production'
  # Unicorn self-process killer
  require 'unicorn/worker_killer'

　　　　max_request_min =  ENV['UNICORN_MAX_REQUEST_MIN']&.to_i || 3072
  max_request_max =  ENV['UNICORN_MAX_REQUEST_MAX']&.to_i || 4096

  # Max requests per worker
  use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max

  # テスト的に100MB～200MBに設定。この間でランダムに値を取得し、それを上限値としているっぽい。
  oom_min = ((ENV['UNICORN_OOM_MIN']&.to_i || 100) * (1024**2))
  oom_max = ((ENV['UNICORN_OOM_MAX']&.to_i || 200) * (1024**2)) 

  # Max memory size (RSS) per worker
  use Unicorn::WorkerKiller::Oom, oom_min, oom_max, 2 # この2はcheck_cycleを指定している。指定しない場合は16が適用される。
end