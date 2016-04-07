#!/usr/bin/env bash

echo "Updating apt get..."
sudo apt-get update

#*******************************************************************************

echo "Installing Git..."
sudo apt-get install -y git

#*******************************************************************************

echo "Installing MySQL..."
sudo apt-get install -y mysql-client libmysqlclient-dev
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password 12345'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password 12345'
sudo apt-get -y install mysql-server

#*******************************************************************************

echo "Installing MongoDB..."
sudo apt-get install -y mongodb

#*******************************************************************************

if hash rbenv 2> /dev/null; then
  echo "Rbenv is already installed"
else
  echo "Installing rbenv..."
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.profile
  echo 'eval "$(rbenv init -)"' >> ~/.profile

  echo "Installing rbenv ruby build plugin..."
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
  sudo apt-get install -y autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev
fi

#*******************************************************************************

source ~/.profile

# Ruby installation
if rbenv versions | grep 2.2.2 > /dev/null; then
  echo "Ruby is already installed"
else
  rbenv install 2.2.2
fi

rbenv global 2.2.2

#*******************************************************************************

echo "Installing Bundler..."
gem install bundler

#*******************************************************************************

echo "Installing puthon-software-properties..."
sudo apt-get install -y python-software-properties

echo "Adding rabbitmq repository..."
sudo apt-add-repository "deb http://www.rabbitmq.com/debian/ testing main"

echo "Updating apt get..."
sudo apt-get update

#*******************************************************************************
echo "Installing freetds-dev package..."
sudo apt-get install -y freetds-dev

#*******************************************************************************
echo "Installing rails..."
gem install rails
