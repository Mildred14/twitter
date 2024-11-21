ENV['RAILS_ENV'] ||= 'test'

require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/mock'

module ActiveSupport
  include Warden::Test::Helpers
  class TestCase
    # Run tests in parallel with specified workers
    workers = ENV.fetch("TEST_WORKERS", nil)
    parallelize(workers: workers ? workers.to_i : :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all
  end
end