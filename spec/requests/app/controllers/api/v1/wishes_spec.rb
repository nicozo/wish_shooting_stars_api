require 'rails_helper'

RSpec.describe "App::Controllers::Api::V1::Wishes", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/app/controllers/api/v1/wishes/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/app/controllers/api/v1/wishes/create"
      expect(response).to have_http_status(:success)
    end
  end

end
