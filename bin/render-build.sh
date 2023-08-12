#!/bin/sh

# Set environment variables if needed
export RAILS_ENV=production
export SECRET_KEY_BASE=e330218f9bafe8959aadcae5ec03d766982fe5fb1fb29b865ebd7cbdfc184f528ddf56c7c34ccadcee858e02fbcf111703982dcb16a80b3461ae415a7160c75f


# Install dependencies
bundle install --deployment --without development:test

# Run database migrations
bundle exec rake db:migrate

# Precompile assets
bundle exec rake assets:precompile

# Start the application server
bundle exec rails server -e production
