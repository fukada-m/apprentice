require 'rails_helper'

RSpec.describe "TodoApis", type: :request do
  describe "GET /todos" do
    it "works! (now write some real specs)" do
      get '/todos'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /todos" do
    it "redirects to the new todo" do
      post "/todos", params: {todo: { title: "test todo" }}
      expect(response).to have_http_status(201)
    end
end
end
