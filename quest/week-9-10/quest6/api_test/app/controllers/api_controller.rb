class ApiController < ApplicationController
  def get
    render json: { status: "success" }
  end
end
