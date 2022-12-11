source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.0"

gem "rails", "~> 7.0.4"
gem "sqlite3", "~> 1.4"
gem "puma", "~> 5.0"

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
end

gem 'rack-cors'
gem 'devise'
gem 'devise-jwt'
gem 'dotenv-rails', groups: [:development, :test]
gem "cancan"
gem 'pagy'


gem "case_transform", "~> 0.2"
gem "grape", "~> 1.6"
gem "grape_on_rails_routes", "~> 0.3.2"
gem "active_model_serializers", "~> 0.10.13"
gem "grape-active_model_serializers", "~> 1.5"
