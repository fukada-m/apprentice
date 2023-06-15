require 'jwt'

class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  def register
    @body = params.require(:user).permit(:email,:password)
    @user = User.new(@body)
    if @user.save
      render json: {
        user: {
          email: @user.email,
          token: nil
        }
      }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    @body = params.require(:user).permit(:email,:password)
    @user = User.find_by(email: @body[:email])
    if @user.authenticate(@body[:password])
      render json: {
        user: {
          email: @user.email,
          token: nil
        }
      }, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
