require 'rails_helper'

RSpec.describe "TodoRequests", type: :request do
  describe "GET /todos" do
    it "レスポンスとしてHTTPステータスコード200が返ってくる" do
      get '/todo/index'
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /todos" do
    it "リダイレクトされる" do
      post "/todo/create", params: {todo: { title: "test todo" }}
      expect(response).to have_http_status(:redirect)
    end
end
end
