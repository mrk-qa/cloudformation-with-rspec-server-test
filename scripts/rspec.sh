#!/bin/bash
set -e
rspec_tests=$1

if [[ -z "{rspec_tests}" ]]; then
	echo "usage: $0 ${rspec_tests} directory..."
	exit 1
fi
if [[ ! -d "${rspec_tests}" ]]; then
	echo "${rspec_tests} directory is not readable..."
	exit 1
fi	

echo "Running ServerSpec tests in directory ${rspec_tests}"
sudo yum install -y gcc
sudo yum install gnupg2
gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm get head
rvm install 2.5.1
ruby --version
gem update --system 3.2.3
gem install bundler -v 2.3.27
gem install net-ssh -v 6.1.0
gem install io-console -v 0.5.9
gem install rspec_junit_formatter -v 0.2.3
gem install rake rspec json
cd $rspec_tests
bundle
echo "[ServerSpec Tests (${rspec_tests}) Start @ $(date)]"
rspec || exit 1
echo "[ServerSpec Tests (${rspec_tests}) Complete @ $(date)]"
bundle clean --force
