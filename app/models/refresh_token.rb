require_relative 'concerns/oauth2_token'

class RefreshToken < ActiveRecord::Base
  include Concerns::OAuth2Token
  self.default_lifetime = 1.month
  has_many :access_tokens
end
