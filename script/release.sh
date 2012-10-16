#!/bin/sh

export RAILS_ENV=production

git pull origin master
bundle install
bundle exec rake db:migrate
bundle exec rake assets:precompile
sudo restart helloworkapi
