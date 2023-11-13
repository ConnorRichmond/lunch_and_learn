class CountryFacade
  def random_country
    json = service.random_country

    country = json.sample()

    country[:name][:common]
  end

  def search_country_lat_long(country)
    json = service.search_country_lat_long(country)

    if json.first[:capitalInfo].empty?
      json.first[:latlng]
    else
      json.first[:capitalInfo][:latlng]
    end
  end

  private

  def service
    CountryService.new
  end
end