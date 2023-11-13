class CountryService
  
  def conn
    Faraday.new(url: "https://restcountries.com")
  end

  def get_url(url)
    response = conn.get(url)
    
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def random_country
    get_url("/v3.1/all?fields=name")
  end

  def capital(query)
    get_url("/v3.1/capital/#{query}")
  end

  def search_country_lat_long(country)
    get_url("/v3.1/name/#{country}")
  end
end