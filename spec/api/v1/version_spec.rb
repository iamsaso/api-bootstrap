require 'spec_helper'

RSpec.describe '/api/v1/version', type: :api do
  def app
    API::V1::Base
  end

  describe 'get' do
    it 'renders current version' do
      get '/v1/version', :format => :json

      expect(last_response.status).to eq(200)
      body = JSON.parse(last_response.body)
      expect(body).to include('build')
      expect(body).to include('version')
    end
  end
end