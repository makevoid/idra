require_relative '../lib/idra'
require_relative 'typhoeus_helpers'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :should
  end

  config.before :each do
    Typhoeus::Expectation.clear
  end

  config.include TyphoeusHelpers
end
