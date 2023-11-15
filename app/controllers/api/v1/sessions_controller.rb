class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: sessions_params[:email])
    if user&.authenticate(sessions_params[:password])
      render json: UserSerializer.new(user)
    else
      render json: ErrorSerializer.new(ErrorMessage.new("Your credentials are incorrect, please try again.", 400)).serialize_json, status: 400
    end
  end

  def sessions_params
    params.permit(:email, :password)
  end
end