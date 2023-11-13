class PlacesFacade
  def sites_by_lat_long(coordinates)
    json = service.sites_by_lat_long(coordinates)

    sites = json[:features].map do |site_data|
      TouristSite.new(site_data)
    end
  end

  private

  def service
    PlacesService.new
  end
end