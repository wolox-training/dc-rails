source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Turbolinks makes navigating your web application faster.
gem 'turbolinks', '~> 5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'active_model_serializers', '~> 0.10.0'
gem 'devise', '~> 4.3'
gem 'jwt'
gem 'versionist'
gem 'activeadmin', '~> 1.1', github: 'activeadmin'
gem 'pundit', '~> 1.1'

gem 'wor-paginate', git: 'https://github.com/Wolox/wor-paginate.git', branch: 'feature/updating-railties-dependency'
gem 'omniauth-google-oauth2', '~> 0.5.2'
gem "interactor", "~> 3.0"
gem 'rest-client', '~> 2.0', '>= 2.0.2'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-byebug', '~> 3.4'
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'dotenv-rails', '~> 2.2.1'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop', '~> 0.49.1'
  gem 'rubocop-rspec', '1.15.0'
  gem 'sass', '~> 3.5'
  gem 'selenium-webdriver'
  gem 'slim', '~> 3.0'
end

group :development do
  gem 'letter_opener', '~> 1.4'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background.
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'sidekiq', '~> 5.0', '>= 5.0.4'
  gem 'sidekiq-status', '~> 0.6.0'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker', '~> 1.8'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git',
                          branch: 'rails-5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
