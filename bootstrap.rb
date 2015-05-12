ENV['RACK_ENV'] ||= 'development'

APP_ROOT = File.expand_path('../', __FILE__)

require 'rubygems'
require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

# lib
Dir.glob(File.expand_path("./lib/**/*.rb")).each do |file|
  require file
end

# models
Dir.glob(File.expand_path("./app/models/**/*.rb")).each do |file|
  require file
end

require_relative './app/run'

# init
Dotenv.load