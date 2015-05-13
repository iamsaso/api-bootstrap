module Concerns
  module AuthScope
    extend ActiveSupport::Concern

    included do
      cattr_accessor :_auth_scope
    end

    def auth_scope
      self._auth_scope ||= ::AuthScope.new(App::Base.session[:current_token].scope)
    end

    def scope_admin?
      auth_scope.can? 'admin'
    end

    def scope_can? param
      return true if scope_admin?
      auth_scope.can? param
    end

    def scope_any? param
      return true if scope_admin?
      auth_scope.any? param
    end

    def scope_all? param
      return true if scope_admin?
      auth_scope.all? param
    end
  end
end
