source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "rails", "~> 6.1.4", ">= 6.1.4.1"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.4", require: false
gem "rack-cors", "~> 1.1", ">= 1.1.1"
gem "rswag", "~> 2.4"


group :development, :test do
  gem "factory_bot_rails", "~> 6.2"
  gem "ffaker"
  gem "rspec-rails", "~> 5.0", ">= 5.0.2"
end

group :development do
  gem "spring"
end

group :test do
  gem "shoulda-matchers", "~> 5.0"
end
