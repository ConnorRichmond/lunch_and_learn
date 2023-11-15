class RecipeFacade
  def search_by_country(country)
    json = service.search_by_country(country)
    
    recipes = json[:hits].map do |recipe_data|
      Recipe.new(recipe_data, country)
    end
  end

  private

  def service
    RecipeService.new
  end
end
