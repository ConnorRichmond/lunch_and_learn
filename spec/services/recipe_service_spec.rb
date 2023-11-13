require "rails_helper"

RSpec.describe RecipeService do
  describe "instance methods" do
    describe "#search_by_country" do
      it "returns country data by search" do
        VCR.use_cassette("thailand_recipe_search") do
          response = RecipeService.new.search_by_country("thailand")

          expect(response[:hits]).to be_an(Array)

          recipe_data = response[:hits].first[:recipe]

          expect(recipe_data).to have_key(:uri)
          expect(recipe_data[:uri]).to be_a(String)
          
          expect(recipe_data).to have_key(:label)
          expect(recipe_data[:label]).to be_a(String)

          expect(recipe_data).to have_key(:image)
          expect(recipe_data[:image]).to be_a(String)

          expect(recipe_data).to have_key(:images)
          expect(recipe_data[:images]).to be_a(Hash)

          expect(recipe_data).to have_key(:label)
          expect(recipe_data[:label]).to be_a(String)

          expect(recipe_data).to have_key(:source)
          expect(recipe_data[:source]).to be_a(String)

          expect(recipe_data).to have_key(:url)
          expect(recipe_data[:url]).to be_a(String)

          expect(recipe_data).to have_key(:shareAs)
          expect(recipe_data[:shareAs]).to be_a(String)

          expect(recipe_data).to have_key(:yield)
          expect(recipe_data[:yield]).to be_a(Float)

          expect(recipe_data).to have_key(:dietLabels)
          expect(recipe_data[:dietLabels]).to be_an(Array)
          
          expect(recipe_data).to have_key(:healthLabels)
          expect(recipe_data[:healthLabels]).to be_an(Array)

          expect(recipe_data).to have_key(:label)
          expect(recipe_data[:label]).to be_a(String)

          expect(recipe_data).to have_key(:cautions)
          expect(recipe_data[:cautions]).to be_an(Array)

          expect(recipe_data).to have_key(:ingredientLines)
          expect(recipe_data[:ingredientLines]).to be_an(Array)

          expect(recipe_data).to have_key(:ingredients)
          expect(recipe_data[:ingredients]).to be_an(Array)

          expect(recipe_data).to have_key(:calories)
          expect(recipe_data[:calories]).to be_a(Float)

          expect(recipe_data).to have_key(:totalCO2Emissions)
          expect(recipe_data[:totalCO2Emissions]).to be_a(Float)

          expect(recipe_data).to have_key(:co2EmissionsClass)
          expect(recipe_data[:co2EmissionsClass]).to be_a(String)

          expect(recipe_data).to have_key(:totalWeight)
          expect(recipe_data[:totalWeight]).to be_a(Float)

          expect(recipe_data).to have_key(:totalTime)
          expect(recipe_data[:totalTime]).to be_a(Float)

          expect(recipe_data).to have_key(:cuisineType)
          expect(recipe_data[:cuisineType]).to be_an(Array)

          expect(recipe_data).to have_key(:mealType)
          expect(recipe_data[:mealType]).to be_an(Array)

          expect(recipe_data).to have_key(:dishType)
          expect(recipe_data[:dishType]).to be_an(Array)

          expect(recipe_data).to have_key(:totalNutrients)
          expect(recipe_data[:totalNutrients]).to be_a(Hash)

          expect(recipe_data).to have_key(:totalDaily)
          expect(recipe_data[:totalDaily]).to be_a(Hash)

          expect(recipe_data).to have_key(:digest)
          expect(recipe_data[:digest]).to be_an(Array)
        end
      end
    end
  end
end