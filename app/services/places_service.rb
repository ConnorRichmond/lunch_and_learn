class PlacesService
  def sites_by_lat_long(coordinates)
    lat = coordinates[0]
    long = coordinates[1]
    
    get_url("/v2/places?categories=tourism.sights&filter=circle:#{long},#{lat},1000")
  end


  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.geoapify.com") do |faraday|
      faraday.params["apiKey"] = Rails.application.credentials.places[:key]
    end
  end
end