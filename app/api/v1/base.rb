# Resources
require_relative "./resources/version"
require_relative "./resources/users"

# Entities
require_relative "./entities/user"

module API
  module V1
    class Base < Grape::API
      version 'v1', using: :path, vendor: 'sample', cascade: false
      format :json

      content_type :json, 'application/json'
      content_type :xml, 'application/xml'

      helpers do
        def require_oauth_token!
          @current_token = request.env[Rack::OAuth2::Server::Resource::ACCESS_TOKEN]
          fail Rack::OAuth2::Server::Resource::Bearer::Unauthorized unless @current_token
        end
      end

      mount API::V1::Resources::Version
      mount API::V1::Resources::Users

      add_swagger_documentation(
        api_version: 'api/v1',
        mount_path: 'doc',
        hide_documentation_path: true,
        markdown: false
      )
    end
  end
end