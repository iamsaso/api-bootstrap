module API
  module V1
    module Entities
      class User < Grape::Entity
        expose :name
      end
    end
  end
end
