ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/bm.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'dm-rspec'
require 'database_cleaner'

def create_link
  link = Link.create(title: 'Makers Academy', url: 'http://makersacademy.se', description: 'Whatever')
  link.save
end

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include DataMapper::Matchers

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|

    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
