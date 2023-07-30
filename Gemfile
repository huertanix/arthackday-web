source 'https://rubygems.org'
ruby "3.0.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '6.0.6.1'

# Use sqlite3 as the database for Active Record, but not on Heroku
group :development, :test do
  gem 'sqlite3' #, '~> 1.3.6' #, '< 1.4' # older Rails, older sqlite3 version
  #gem 'pg' # temporary for data migration
  gem 'taps'
end

# Use SCSS for stylesheets
gem 'sass-rails' #, '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier' #, '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails' #, '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder' #, '~> 2.10'

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
#gem 'protected_attributes' # use attr_accessible until Devise supports strong_parameters <-- remove after Rails 5 upgrade
#gem 'devise', '3.2.2'
gem 'devise' #, '~> 4.0'

# Nested form support
gem 'nested_form' #, :git => "git://github.com/madebydna/nested_form.git"

# Geocoding venue lat/lon for maps
gem 'geocoder'

# Semantic URLs (defined in event model)
gem 'friendly_id', '~> 5.0.0' # Need 5.0.0 or above for Rails 4

# File uploads, because it's a fucking mission to Jupiter with just Rails
gem 'paperclip' #, '~> 4.3'

# For the rake task parsing out html from old project descriptions
gem 'nokogiri'

# Amazon S3
gem 'aws-sdk'

# Contact form
gem 'mail_form'

# Twitter profile pic rake tasks
gem 'twitter'

# Web server for local instances
gem 'thin'

# Gotta go fast!
gem 'bootsnap', require: false

# Heroku stuff
group :production, :staging do
  gem 'pg', '~> 0.21' # Use old-ass version of pg for Rails < 5.1.5
  gem 'rails_12factor'
  gem 'puma'
end

# New for Rails 6+
gem 'webpacker'

