source 'http://rubygems.org'

gem 'rails', '~> 3.2.0'
gem "rails_admin", :git => "git://github.com/sferik/rails_admin.git"
gem 'rails_admin_tag_list_field', :git => 'https://github.com/kryzhovnik/rails_admin_tag_list_field.git'

gem "haml", ">= 3.0.0"
gem "haml-rails"
gem "jquery-rails"
gem 'devise'
gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
gem 'aws-sdk'
gem "friendly_id", "~> 3.2.1"
#gem 'twitter'
gem 'acts_as_indexed'
gem 'RedCloth'
gem 'acts-as-taggable-on'
gem 'acts_as_tree'
gem 'dalli'
gem 'thin'
gem 'pg'

group :assets do
  gem 'compass-rails','~> 1.0.0.rc.2'
  #Compass plugins optional below
  #gem 'compass-colors'
  #gem 'sassy-buttons'
  gem 'sass-rails', '~> 3.2.3'
  gem 'coffee-script'
  gem 'uglifier'
end

group :development do
  gem "heroku_plus"
  gem 'guard'
  gem 'guard-rspec'
  gem 'rb-fsevent'
  gem 'growl'
end

# Heroku Cedar does not support BUNDLE_WITHOUT
# http://getsatisfaction.com/heroku/topics/bundle_without_on_cedar
cucumber = (ENV['HOME'].gsub('/','') == 'app' ? 'test' : 'cucumber')

group :test, cucumber do
  gem "rspec-rails"
  gem "cucumber-rails"
  gem "capybara"
  gem 'database_cleaner'
  gem "execjs" #for CI on Heroku
  gem "therubyracer" #for CI on Heroku
  #gem 'pg' #for CI on Heroku
  gem "fastercsv"
  gem "faker"
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'webmock' 
end

group :production do
end


