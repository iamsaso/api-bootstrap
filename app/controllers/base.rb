module Controllers
  class Base < Sinatra::Base
    set :views, File.expand_path('../../views', __FILE__)

    configure :production, :development do
      enable :logging
    end

    get '/' do
      "Hello World"
    end
  end
end

require_relative "oauth2"
