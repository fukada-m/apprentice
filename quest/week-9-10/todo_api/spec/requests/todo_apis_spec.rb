require 'rails_helper'

RSpec.describe "TodoApis", type: :request do
  describe "GET /todo_apis" do
    it "works! (now write some real specs)" do
      get todo_apis_path
      expect(response).to have_http_status(200)
    end
  end
end
