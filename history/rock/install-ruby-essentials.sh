#!/bin/bash
set -x
set -e

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

source ~/.bashrc

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

sudo apt-get update \
    && sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev  \ # essentials for rbenv install ruby
    && sudo apt-get install -y libsqlite3-dev \ # essentials for sqlite
    && sudo rm -rf /var/lib/apt/lists/*

~/.rbenv/bin/rbenv install 2.2.3
~/.rbenv/bin/rbenv rehash
~/.rbenv/bin/rbenv global 2.2.3

sudo gem install bundler
sudo gem install sqlite3 --no-rdoc --no-ri
sudo gem install rails

~/.rbenv/bin/rbenv rehash
