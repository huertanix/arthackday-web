source 'https://rubygems.org'
ruby "1.9.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'

# Use sqlite3 as the database for Active Record, but not on Heroku
group :development, :test do
  gem 'sqlite3'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# User management
gem 'protected_attributes' # use attr_accessible until Device supports strong_parameters
gem 'devise', '3.0.0.rc'

# Nested form support
gem "nested_form" #, :git => "git://github.com/madebydna/nested_form.git"

# Geocoding venue lat/lon for maps
gem 'geocoder'

# Semantic URLs (defined in event model)
gem 'friendly_id', '~> 5.0.0' # Need 5.0.0 or above for Rails 4

# Heroku stuff
group :production do
  gem 'pg'
  gem 'rails_12factor'
end