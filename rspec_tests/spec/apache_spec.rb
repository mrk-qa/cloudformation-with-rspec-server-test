require 'spec_helper'

describe service('httpd') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

describe file('/etc/httpd/conf/httpd.conf') do
  it { should exist }
  it { should be_owned_by 'root' }
  it { should contain 'ServerName www.example.com' }
end

describe file('/etc/httpd/conf/httpd.conf') do
  its(:content) { should match /ServerName www.example.com/ }
end

describe file('/var/www/html/hello.html') do
  it { should exist }
  it { should be_owned_by 'ec2-user' }
end

describe file('/var/log/httpd') do
  it { should be_directory }
end

describe file('/etc/sudoers') do
  it { should be_mode 440 }
end

describe group('root') do
  it { should have_gid 0 }
end
