class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country] == "random_choice"
      country = country_facade.random_country
      recipes = recipe_facade.search_by_country(country)
    else
      recipes = recipe_facade.search_by_country(params[:country])
    end

    render json: RecipeSerializer.new(recipes)
  end

  def recipe_facade
    RecipeFacade.new
  end

  def country_facade
    CountryFacade.new
  end
end