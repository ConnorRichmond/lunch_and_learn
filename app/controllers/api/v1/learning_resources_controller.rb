class Api::V1::LearningResourcesController < ApplicationController
  def index
    video = video_facade.video_by_country(params[:country])

    photos = photo_facade.photo_by_country(params[:country])

    learning_resource = LearningResource.new(params[:country], video, photos)

    render json: LearningResourceSerializer.new(learning_resource)
  end

  private

  def video_facade
    VideoFacade.new
  end

  def photo_facade
    PhotoFacade.new
  end
end