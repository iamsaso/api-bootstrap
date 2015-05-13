require_relative 'concerns/auth_scope'

class User < ActiveRecord::Base
  include Concerns::AuthScope

  has_many :clients
  has_many :access_tokens
  has_many :authorization_codes
end
