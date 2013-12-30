require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

# Loading more in this block will cause your tests to run faster.
Spork.prefork do
  
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'
  require 'database_cleaner'
  require 'factory_girl_rails'


  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  RSpec.configure do |config|

    Capybara.javascript_driver = :webkit

    config.before(:each) do
      # DatabaseCleaner.orm = "mongoid" 
      DatabaseCleaner.strategy = :truncation#, {:except => %w[ neighborhoods ]}
      DatabaseCleaner.clean
    end
    # for apipie
    # config.treat_symbols_as_metadata_keys_with_true_values = true
    # config.filter_run :show_in_doc => true if ENV['APIPIE_RECORD']
    
    # config.order = "random"
    config.mock_with :rspec
    config.include FactoryGirl::Syntax::Methods
    config.include SessionHelpers
    config.include PicksHelpers
    config.include MatchesHelpers
    # config.include Helpers
    # config.include Rack::Test::Methods
  end
end

# This code will be run each time you run your specs.
Spork.each_run do
end
