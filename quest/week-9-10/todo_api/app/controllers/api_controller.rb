class ApiController < ApplicationController
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

    
  end
end
