module API
  module V1
    module Entities
      class User < Grape::Entity
        expose :id, :scope, if: lambda { |user, options| user.scope_admin? }
        expose :name, if: lambda { |user, options| user.scope_any? "user" }
        expose :email, if: lambda { |user, options| user.scope_any? "user:email" }
      end
    end
  end
end
