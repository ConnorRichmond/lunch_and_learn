class Api::V1::TouristSitesController < ApplicationController
  def index
    coordinates = country_facade.search_country_lat_long(params[:country])
    
    tourist_sites = places_facade.sites_by_lat_long(coordinates)

    render json: TouristSiteSerializer.new(tourist_sites)
  end

  private

  def country_facade
    CountryFacade.new
  end

  def places_facade
    PlacesFacade.new
  end
end