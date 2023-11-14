class PhotoService
  def photo_by_country(country)
    get_url("/search/photos?query=#{country}")
  end

  def get_url(url)
    response = conn.get(url)

    JSON.parse(response.body,symbolize_names: true)
  end

  def conn
    Faraday.new(url: "https://api.unsplash.com") do |faraday|
      faraday.params["client_id"] = Rails.application.credentials.unsplash[:key]
    end
  end
end