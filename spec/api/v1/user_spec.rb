require 'spec_helper'

RSpec.describe '/api/v1/user', type: :api do
  def app
    API::V1::Base
  end

  describe 'get' do
    it 'renders current user' do
      get '/v1/user', :format => :json

      expect(last_response.status).to eq(401)
    end
  end
end