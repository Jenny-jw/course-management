ruby '3.1.0'
source "https://rubygems.org"

# Rails and core gems
# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.0"
# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Database configurations
group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem "sqlite3", ">= 1.4"
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  
  # Debugging and static analysis tools
  gem "debug", platforms: %i[ mri mswin mswin64 mingw x64_mingw ], require: "debug/prelude"
  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false
  # Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
  gem "rubocop-rails-omakase", require: false

  # RSpec and testing tools
  gem "rspec-rails", "~> 6.0"
  gem "rails-controller-testing"
  gem "dotenv-rails"
end

# Development tools
group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"
  # Highlight the fine-grained location where an error occurred [https://github.com/ruby/error_highlight]
  gem "error_highlight", ">= 0.4.0", platforms: [ :ruby ]
end

# Testing tools
group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers", "~> 5.0"
end

# Production database configuration
group :production do
  # Use PostgreSQL in production
  gem "pg", "~> 1.5"
end

# Optional gems
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mswin mswin64 mingw x64_mingw jruby ]
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
gem "acts_as_list"
# Drag-and-drop reordering function
gem "jquery-rails"
gem "jquery-ui-rails"