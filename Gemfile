source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# sudo apt-get install libmagick++-dev
gem 'rmagick', '~> 2.15.4'

gem 'carrierwave'
gem 'cloudinary'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# User autentication
# https://github.com/plataformatec/devise
gem 'devise'

# Paginador
# https://github.com/amatsuda/kaminari
gem 'kaminari'

# kpumuk/meta-tags
# https://github.com/kpumuk/meta-tags
gem 'meta-tags'

# https://github.com/lassebunk/gretel
gem 'gretel'

gem 'rails_admin_rollincode', '~> 1.0'
gem 'rails_admin'
gem 'ckeditor_rails'

# https://github.com/plataformatec/mail_form
gem 'mail_form'

# http://puma.io/
gem 'puma'

# https://rubygems.org/gems/acts_as_commentable
#gem 'acts_as_commentable', '>= 4.0.2'

# https://rubygems.org/gems/slim
gem 'slim-rails'

gem 'sendgrid'

gem 'pagarme'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Test Tools
  # http://www.rubydoc.info/gems/rspec-rails/file/README.md
  gem 'rspec-rails', '~> 3.4'
  # http://www.rubydoc.info/gems/factory_girl_rails/4.7.0
  gem 'factory_girl_rails', '~> 4.7'
  # http://www.rubydoc.info/gems/capybara/2.7.0
  gem 'capybara', '~> 2.7'
  # http://www.rubydoc.info/gems/database_cleaner/1.5.1
  gem 'database_cleaner', '~> 1.5'
  # http://www.rubydoc.info/gems/selenium-webdriver/2.53.0
  gem 'selenium-webdriver', '~> 2.53'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  gem 'capistrano-passenger',   require: false
  gem 'capistrano-faster-assets'

  gem 'quiet_assets'

  gem 'better_errors'
end