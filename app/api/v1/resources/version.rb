module API
  module V1
    module Resources
      class Version < Grape::API
        resource :version do
          desc "Return application version"
          get do
            {
              build: "alpha",
              version: "0.0.1",
            }
          end
        end
      end
    end
  end
end