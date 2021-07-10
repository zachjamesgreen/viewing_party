web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
release: rails db:migrate; yarn install; rails webpacker:install; rails webpacker:compile