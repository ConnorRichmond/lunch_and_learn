class PhotoFacade
  def photo_by_country(country)
    json = service.photo_by_country(country)

    photos = json[:results].map do |photo_data|
      Photo.new(photo_data)
    end
  end

  private

  def service
    PhotoService.new
  end
end