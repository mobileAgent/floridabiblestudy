source 'http://rubygems.org'

gem 'rails', '6.1.7.10'

# Asset pipeline gems bump in lockstep with Rails 4.2
# Rails 6 wants Webpacker as a default but you can opt out
# (much less work right now than rewriting your JS).
gem 'sass-rails', '>= 6'
gem 'jquery-rails'
gem 'logger'
gem 'concurrent-ruby', '< 1.3.5'

# mysql2 — Rails 4.2's adapter accepts ~> 0.3.13 OR 0.4.x.
# Drop the version pin entirely and let bundler pick.
gem 'mysql2'

gem 'dynamic_form'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'uglifier', '>= 1.0.3'

# Extracted from core by Rails 4.2
gem 'actionpack-page_caching', '~> 1.2'

gem 'ffi', '~> 1.15.5'
gem 'jquery-ui-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'   # was bcrypt-ruby

# Deploy with Capistrano
gem 'capistrano',         '~> 3.17'
gem 'capistrano-rails',   '~> 1.6'
gem 'capistrano-bundler', '~> 2.1'
gem 'capistrano-rbenv',   '~> 2.2'

group :development, :test do
  gem 'thin'
end

group :test do
  gem 'rspec-rails',       '~> 4.1'
  gem 'capybara',          '~> 3.36.0'
  gem 'database_cleaner-active_record', '~> 2.0'  # 2.x split
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'test-unit',         '~> 3.0'  # required by rspec-rails on Ruby 2.2+
  gem 'simplecov', :require => false
end
