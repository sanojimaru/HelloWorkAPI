#!/bin/sh
RAILS_ENV=production && bundle exec rails r "Hellowork::Core.new.run" >> log/import.log 2>&1
