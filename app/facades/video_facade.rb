class VideoFacade
  def video_by_country(country)
    json = service.video_by_country(country)

    if json[:items].empty?
      video = {}
    else
      video_json = json[:items].first
  
      video = Video.new(video_json)
    end
  end

  private

  def service
    VideoService.new
  end
end