class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])

    if user
      render json: FavoriteSerializer.new(user.favorites)
    else
      render json: ErrorSerializer.new(ErrorMessage.new("Api key invalid", 400)).serialize_json, status: 400
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])

    if user
      begin
        favorite = user.favorites.create!(favorites_params)
        render json: {success: "Favorite added successfully"}
      rescue ActiveRecord::RecordInvalid => exception
        render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400)).serialize_json, status: 400
      end
    else
      render json: ErrorSerializer.new(ErrorMessage.new("Api key invalid", 400)).serialize_json, status: 400
    end
  end

  private

  def favorites_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end