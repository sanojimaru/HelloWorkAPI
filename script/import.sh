#!/bin/sh
export PATH=/opt/rubies/1.9.3-p194/bin:$PATH
export RAILS_ENV=production

bundle exec rails r "Hellowork::Core.new.run" >> log/import.log 2>&1
