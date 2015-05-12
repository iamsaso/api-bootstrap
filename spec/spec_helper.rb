require File.dirname(__FILE__) + '/../application.rb'

require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods, type: :api
  config.raise_errors_for_deprecations!
end