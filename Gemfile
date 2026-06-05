source 'http://rubygems.org'

gem 'rails', '5.2.8.1'

# Asset pipeline gems bump in lockstep with Rails 4.2
gem 'sass-rails',   '~> 5.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'

# mysql2 — Rails 4.2's adapter accepts ~> 0.3.13 OR 0.4.x.
# Drop the version pin entirely and let bundler pick.
gem 'mysql2'

gem 'dynamic_form'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'uglifier', '>= 1.0.3'
end

# Extracted from core by Rails 4.2
gem 'actionpack-page_caching'

gem 'ffi', '~> 1.15.5'
gem 'jquery-ui-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'   # was bcrypt-ruby

# Deploy with Capistrano
gem 'capistrano'

group :development, :test do
  gem 'thin'
end

group :test do
  gem 'rspec-rails',       '~> 4.1.0'
  gem 'capybara',          '~> 3.36.0'
  gem 'database_cleaner',  '~> 1.8.5'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'test-unit',         '~> 3.0'  # required by rspec-rails on Ruby 2.2+
  gem 'simplecov', :require => false
end
