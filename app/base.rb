require_relative "./api/base"
require_relative "./controllers/base"

module App
  class Base
    def initialize
      @filenames = ['', '.html']
      @rack_static = ::Rack::Static.new(
        -> { [404, {}, []] },
        root: File.expand_path('../../public', __FILE__),
        urls: %w(/)
      )
    end

    def self.config
      @config ||= Config.load!(filename: File.expand_path('../../config/application.yml', __FILE__), env: ENV['RACK_ENV'])
    end

    def self.session
      @session ||= {}
    end

    # rubocop:disable MethodLength
    def self.instance
      @instance ||= Rack::Builder.new do
        use Rack::Static, urls: ['/apidoc'], root: 'public'
        use Rack::PostBodyContentTypeParser

        map "/" do
          run Controllers::Base
        end

        map "/oauth" do
          run Controllers::OAuth2
        end

        map "/api" do
          use Rack::Cors do
            allow do
              origins '*'
              resource '*', headers: :any, methods: :get
            end
          end

          use Rack::OAuth2::Server::Resource::Bearer, 'API' do |req|
            AccessToken.valid.find_by_token(req.access_token) || req.invalid_token!
          end

          run API::Base
        end

        run App::Base.new
      end.to_app
    end
  end
end
