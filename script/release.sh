#!/bin/sh

export RAILS_ENV=production

git pull origin master
bundle install
rake db:migrate
rake assets:precompile:all
restart helloworkapi
