require 'serverspec'
set :backend, :exec

set :path, '/usr/bin:/root/bin:/usr/local/bin:/sbin:/usr/sbin:$PATH'
