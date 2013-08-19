source 'https://rubygems.org'
ruby "2.0.0"

gem 'rails', '4.0.0'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
end
#gem 'rroonga', require: 'groonga'
gem 'pg'
gem 'sewell'
gem 'thin'
gem 'mechanize'

gem 'omniauth-oauth', github: 'ssig33/omniauth-oauth'
gem 'omniauth-twitter'
gem 'kaminari'
gem 'haml'
gem 'omniauth-openid'
gem 'omniauth-facebook'
gem 'twitter'
gem 'rmagick', require: 'RMagick'
gem 'dalli'

gem 'exception_notification',github: 'smartinez87/exception_notification'

gem 'sass-rails'
gem 'coffee-rails'
gem 'uglifier'

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
group :development, :test do
  gem 'rspec-rails'
end

group :production do
  gem 'newrelic_rpm'
end

group :heroku do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  gem 'rails_12factor'
end

