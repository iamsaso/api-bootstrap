module API
  module V1
    module Resources
      class Users < Grape::API
        before do
          require_oauth_token!
        end

        resource :users do
          get do
            users = User.all
            present users, with: API::V1::Entities::User
          end
        end
      end
    end
  end
end