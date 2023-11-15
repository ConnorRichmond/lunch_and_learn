class CountryFacade
  def random_country
    json = service.random_country

    country = json.sample()

    country[:name][:common]
  end

  private

  def service
    CountryService.new
  end
end