source 'http://rubygems.org'

gem 'rails', '3.2.22.5'

gem 'mysql2', '= 0.5.5'

gem 'dynamic_form'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'ffi', '~> 1.15.5'
gem 'bigdecimal', '~> 1.4.4'
gem 'jquery-ui-rails', '~> 4.2'  # 5.x+ requires Rails 4+

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.5', require: 'bcrypt'

# Deploy with Capistrano
gem 'capistrano'

group :development, :test do
  gem 'thin'
end

group :test do
  gem 'rspec-rails',       '~> 3.9.0'
  gem 'capybara',          '~> 2.18.0'
  gem 'database_cleaner',  '~> 1.8.5'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'test-unit',         '~> 3.0'  # required by rspec-rails on Ruby 2.2+
  gem 'simplecov', :require => false
end
