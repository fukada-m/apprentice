require 'jwt'

class ApplicationController < ActionController::Base
  def authenticate_user
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    decoded_token = JWT.decode token, Rails.application.credentials.secret_key_base, false
    render json: { error: { failed: "ユーザーが登録されていません" }}, status: 401 unless User.find_by(id: decoded_token[0]["user_id"])
  rescue
    render json: { error: "デコードに失敗しました。", token: decoded_token }, status: 401
  end
end
