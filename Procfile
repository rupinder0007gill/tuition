release: bundle exec rails db:migrate && bundle exec rails db:seed
web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -t 25 -c 2