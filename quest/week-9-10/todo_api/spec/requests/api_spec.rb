require 'rails_helper'

RSpec.describe "Apis", type: :request do
  describe "GET /users" do
    it "returns http success" do
      get "/api/users"
      expect(response).to have_http_status(:success)
    end
  end

end
