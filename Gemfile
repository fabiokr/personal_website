source 'http://rubygems.org'

gem 'rails', '~> 3.1.0.rc5'

#libraries
gem 'omniauth', '~> 0.2.6'
gem 'inherited_resources'
gem 'responders'
gem 'slim'
gem 'has_scope'
gem 'kaminari'
gem 'acts_as_list'
gem 'ckeditor'
gem 'paperclip'
gem 'cells'
gem 'acts-as-taggable-on', '2.0.6'
gem 'thin'
gem 'manageable_content'
gem 'json'
gem 'formtastic'
gem 'activo-rails', :git => 'https://github.com/fabiokr/activo-rails.git', :branch => 'rails3_1'

# Rails 3.1 - Asset Pipeline
group :assets do
  gem 'sass-rails'
  gem 'coffee-script'
  gem 'uglifier'
end

gem 'jquery-rails'

group :development, :test do
  gem 'sqlite3'
  gem 'rails3-generators'

  gem 'minitest'
  gem 'simplecov', '>= 0.4.0', :require => false
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'shoulda'
  gem 'guard', :git => 'git://github.com/guard/guard.git'
  gem 'turn', :require => false
end

group :production do
  gem 'pg'
  gem 'newrelic_rpm'
  gem 'therubyracer-heroku', '0.8.1.pre3'
end
