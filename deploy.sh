#!/bin/sh

git pull
bundle install
RAILS_ENV=production rails db:migrate
RAILS_ENV=production rails assets:clean
RAILS_ENV=production rails assets:precompile
whenever --update-crontab
spring stop
kill -9 `cat tmp/pids/server.pid`
SECRET_KEY_BASE=$(rake secret) rails server -e production -p 3020 -d