# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

group :production, :staging, :development, :test do
  # AASM - State machines for Ruby classes
  # Read more: https://github.com/aasm/aasm/blob/master/README.md
  gem 'aasm', '~> 5.1'

  # Rails view helper to manage "active" state of a link
  # Read more: http://github.com/comfy/active_link_to
  gem 'active_link_to', '~> 1.0', '>= 1.0.5'

  # A wrapper around datatable's ajax methods that allow
  # synchronization with server-side pagination
  # Read more: https://github.com/jbox-web/ajax-datatables-rails
  gem 'ajax-datatables-rails', '~> 1.2'

  # to optimize and cache expensive computations
  # Read more: https://github.com/Shopify/bootsnap
  gem 'bootsnap', '~> 1.4', require: false

  # Simple authorization solution for Rails. All permissions are stored in a single location.
  # Read more: https://github.com/CanCanCommunity/cancancan
  gem 'cancancan', '~> 3.1'

  # Unobtrusive nested forms handling, using jQuery
  # Read more: http://github.com/nathanvda/cocoon
  gem 'cocoon', '~> 1.2', '>= 1.2.14'

  # Client Side Validations
  # Read more: https://github.com/DavyJonesLocker/client_side_validations
  gem 'client_side_validations', '~> 17.0'

  # Flexible authentication solution for Rails with Warden
  # Read more: https://github.com/heartcombo/devise
  gem 'devise', '~> 4.7', '>= 4.7.2'

  # Devise extension that checks user passwords against the PwnedPasswords
  # dataset https://haveibeenpwned.com/Passwords.
  # Read more: https://www.rubydoc.info/gems/devise-pwned_password/0.1.8
  gem 'devise-pwned_password', '~> 0.1.8'

  # An enterprise security extension for devise.
  # Read more: https://github.com/devise-security/devise-security
  gem 'devise-security', '~> 0.14.3'

  # Allows marking ActiveRecord objects as discarded,
  # and provides scopes for filtering.
  # Read more: https://rubygems.org/gems/discard
  gem 'discard', '~> 1.2'

  # Font-Awesome SASS
  # Read more: http://www.rubydoc.info/gems/font-awesome-sass/5.11.2
  gem 'font-awesome-sass', '~> 5.13'

  # human-friendly strings as if they were numeric ids for ActiveRecord
  # Read more: http://norman.github.io/friendly_id/file.Guide.html
  gem 'friendly_id', '~> 5.4'

  # Loaf manages and displays breadcrumb trails in your Rails app. It aims to handle breadcrumb
  # data through easy dsl and expose it through view helpers without any assumptions about markup.
  gem 'loaf', '~> 0.9.0'

  # Presenting names of people in full, familiar, abbreviated, and initialized forms
  # Read more: https://github.com/basecamp/name_of_person
  gem 'name_of_person', '~> 1.1', '>= 1.1.1'

  # Track changes to your rails models
  # Read more: http://github.com/airblade/paper_trail
  gem 'paper_trail', '~> 10.3'

  # Use postgresql as the database for Active Record
  # Read more: http://deveiate.org/code/pg/
  gem 'pg', '~> 1.2'

  # Use Puma as the app server
  # Read more: http://puma.io/
  gem 'puma', '~> 4.3'

  # Ruby on Rails is a full-stack web framework optimized for programmer
  # happiness and sustainable productivity. It encourages beautiful code by
  # favoring convention over configuration.
  # Read more: http://rubyonrails.org/
  # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
  gem 'rails', '~> 6.0.3'

  # Roles library without any authorization enforcement
  # Read more: https://github.com/RolifyCommunity/rolify
  gem 'rolify', '~> 5.3'

  # Use SCSS for stylesheets
  # Read more: https://github.com/rails/sass-rails
  gem 'sass-rails', '~> 6.0.0'

  # Simple, efficient background processing for Ruby
  # Read more: http://sidekiq.org/
  gem 'sidekiq', '~> 6.1.1'

  # Catch unsafe migrations at dev time
  # Read more: http://www.rubydoc.info/gems/strong_migrations/
  gem 'strong_migrations', '~> 0.7.1'

  # Turbolinks makes navigating your web application faster.
  # Read more: https://github.com/turbolinks/turbolinks
  gem 'turbolinks', '~> 5.2'

  # Turbolinks makes navigating your web application faster.
  # Read more: https://github.com/turbolinks/turbolinks
  gem 'valid_email2', '~> 3.3'

  # Use development version of Webpacker
  # Read more: https://github.com/rails/webpacker
  gem 'webpacker', '~> 5.2'

  # Ruby C bindings to the excellent Yajl JSON stream-based parser library.
  # Read more: http://github.com/brianmario/yajl-ruby
  gem 'yajl-ruby', '~> 1.4', '>= 1.4.1'
end

group :development, :test do
  # help to kill N+1 queries and unused eager loading
  # Read more: https://github.com/flyerhzm/bullet
  gem 'bullet', '~> 6.1'

  # Call 'byebug' anywhere in the code to stop execution
  # and get a debugger console
  # Read more: https://github.com/deivid-rodriguez/byebug
  gem 'byebug', '~> 11.1'

  # factory_bot_rails provides integration between factory_bot
  # Read more: https://github.com/thoughtbot/factory_bot_rails
  gem 'factory_bot_rails', '~> 6.1'

  # easily generate fake data: names, addresses, phone numbers, etc.
  # Read more: https://github.com/stympy/faker
  gem 'faker', '~> 2.13'
end

group :development do
  # Annotate Rails classes with schema and routes info
  # Read more: https://github.com/ctran/annotate_models
  gem 'annotate', '~> 3.1', require: false

  # Better HTML for Rails. Provides sane html helpers that make it easier to do the right thing.
  # Read more: https://github.com/Shopify/better-html
  gem 'better_html', '~> 1.0', '>= 1.0.15'

  # Brakeman detects security vulnerabilities in Ruby on Rails applications
  # via static analysis.
  # Read more: https://brakemanscanner.org/
  gem 'brakeman', '~> 4.9', require: false

  # ERB Linter tool.
  # Read more: https://github.com/Shopify/erb-lint
  gem 'erb_lint', '~> 0.0.35', require: false

  # Preview mail in the browser instead of sending
  # Read more: http://www.rubydoc.info/gems/letter_opener
  gem 'letter_opener', '~> 1.7'

  # Access an interactive console on exception pages or by calling 'console'
  # anywhere in the code.
  # Read more:
  gem 'listen', '~> 3.2'
  gem 'web-console', '~> 4.0'

  # prettier plugin for the Ruby programming language
  # Read more: https://github.com/prettier/plugin-ruby#readme
  gem 'prettier', '~> 0.19.0'

  # Pronto runs analysis quickly by checking only the relevant changes
  # Read more: https://github.com/prontolabs/pronto
  gem 'pronto', '~> 0.10.0'
  gem 'pronto-brakeman', '~> 0.10.0', require: false
  gem 'pronto-erb_lint', '~> 0.1.5', require: false
  gem 'pronto-rails_best_practices', '~> 0.10.0', require: false
  gem 'pronto-reek', '~> 0.10.0', require: false
  gem 'pronto-rubocop', '~> 0.10.0', require: false
  gem 'pronto-stylelint', '~> 0.10.0', require: false
  # rails_best_practices is a code metric tool to check the quality of Rails code
  # Read more: http://rdoc.rails-bestpractices.com/
  gem 'rails_best_practices', '~> 1.20', require: false

  # Generate and install a favicon for all platforms with RealFaviconGenerator.
  # Read more: https://github.com/RealFaviconGenerator/rails_real_favicon
  gem 'rails_real_favicon', '~> 0.1.0', require: false

  # Tool that examines Ruby classes, modules and methods
  # Read more: http://www.rubydoc.info/gems/reek
  gem 'reek', '~> 5.6', require: false

  # rspec-rails is a testing framework for Rails
  # Read more: https://github.com/rspec/rspec-rails
  gem 'rspec-rails', '~> 4.0.1'

  # Automatic Ruby code style checking tool
  # Read more: https://docs.rubocop.org/
  gem 'rubocop', '~> 0.89.1', require: false
  gem 'rubocop-performance', '~> 1.7', require: false
  gem 'rubocop-rails', '~> 2.7'

  # Shoulda Matchers provides RSpec- and Minitest-compatible
  # one-liners to test common Rails functionality that
  # Read more: https://github.com/thoughtbot/shoulda-matchers
  gem 'shoulda-matchers', '~> 4.3'

  # Spring speeds up development by keeping your application running in the background.
  # Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.0', '>= 2.0.2'
  gem 'spring-watcher-listen', '~> 2.0', '>= 2.0.1'
end
