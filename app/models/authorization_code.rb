require_relative 'concerns/oauth2_token'

class AuthorizationCode < ActiveRecord::Base
  include Concerns::OAuth2Token

  def access_token
    @access_token ||= expired! && user.access_tokens.create(client: client, scope: scope)
  end
end
