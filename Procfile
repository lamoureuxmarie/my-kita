web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
js: yarn build --watch
worker: bundle exec sidekiq -C config/sidekiq.yml
