ENV["RAILS_ENV"] ||= "test"

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!('rails')
end

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'wrong'

class ActiveSupport::TestCase

  include FactoryGirl::Syntax::Methods

  include Wrong

  # Add more helper methods to be used by all tests here...
end
