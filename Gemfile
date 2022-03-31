source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4', group: %i[development test]
gem 'pg', '~> 0.18', '>= 0.18.1', group: :production
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'image_processing', '~> 1.2'

gem 'importmap-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

# Solidus
# gem 'solidus_api', '~> 3.1', '>= 3.1.1'
gem 'solidus_core', '~> 3.1', '>= 3.1.1'

# Admin Panel
gem 'administrate'
gem 'administrate_ransack'
gem 'administrate_exportable'
gem 'administrate_batch_actions'

gem 'administrate-field-active_storage'
gem 'administrate-field-hidden'

# Policy
gem 'action_policy'

# View Component
gem 'view_component'
gem 'view_component-contrib'
gem 'view_component-form'

# Search
gem 'ransack'
gem 'order_query', '~> 0.5.2'

gem 'addressable', '~> 2.8'
gem 'local_time'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'solargraph'
  gem 'solargraph-arc'
  gem 'htmlbeautifier'
  #  gem 'ripper-tags'

  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false

  gem 'rubycritic', require: false
  gem 'erb_lint', require: false
  gem 'reek', require: false

  gem 'overcommit', require: false
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
