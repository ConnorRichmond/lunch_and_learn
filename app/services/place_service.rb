class PlaceService

  def conn
    Faraday.new(url: "https://api.geoapify.com/v2/places") do |faraday|
      faraday.params["catagories"] = "tourism"
      faraday.params["lang"] = "en"
      faraday.params["apiKey"] = Rails.application.credentials.places[:key]
    end
  end
end