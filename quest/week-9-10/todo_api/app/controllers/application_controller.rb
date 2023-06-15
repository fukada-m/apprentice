require 'jwt'

class ApplicationController < ActionController::Base
  def authenticate_user
    auth_header = request.headers['Authorization']
    token = auth_header.split(' ').last
    decoded_token = JWT.decode token, nil, true, { algorithm: 'HS256' }
    render json: {token: decoded_token}
  rescue
    render json: { error: "認証に失敗しました。", token: decoded_token }, status: 401
  end
end
