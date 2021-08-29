source "https://rubygems.org"
git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "active_model_serializers", "~> 0.10.0"
gem "bootsnap", ">= 1.4.4", require: false
gem "devise_token_auth"
gem "dotenv-rails"
gem "jbuilder", "~> 2.7"
# gem "mysql2", "~> 0.5"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "rails", "~> 6.1.3"
gem "rails-i18n", "~> 6.0"
gem "rexml", ">= 3.2.5"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

group :development, :test do
  gem "annotate"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "faker"
  gem "gimei"
  gem "pry-byebug"
  gem "pry-doc"
  gem "pry-rails"
  gem "rails-erd"
  gem "rspec-rails"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "spring-commands-rspec"
end

group :development do
  gem "listen", "~> 3.3"
  gem "rack-mini-profiler", "~> 2.0"
  gem "spring"
  gem "web-console", ">= 4.1.0"
end

group :test do
  gem "capybara", ">= 3.26"
  gem "selenium-webdriver"
  gem "webdrivers"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
