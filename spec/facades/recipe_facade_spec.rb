require "rails_helper"

RSpec.describe RecipeFacade do
  describe "instance methods" do
    describe "#search_by_country" do
      it "should return recipe objects based on a country search" do
        VCR.use_cassette("thailand_recipe_search") do
          recipes = RecipeFacade.new.search_by_country("thailand")

          expect(recipes).to be_an(Array)

          recipe = recipes.first

          expect(recipe).to be_a(Recipe)
          expect(recipe.id).to eq(nil)
          expect(recipe.title).to be_a(String)
          expect(recipe.url).to be_a(String)
          expect(recipe.country).to be_a(String)
          expect(recipe.country).to eq("thailand")
          expect(recipe.image).to be_a(String)
        end
      end
    end
  end
end