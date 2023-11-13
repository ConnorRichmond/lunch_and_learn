require "rails_helper"

RSpec.describe Recipe do
  describe "#initialize" do
    it "returns a recipe object" do
      recipe_data = {
        id: nil,
        recipe: {
          label: "A recipe for food",
          url: "https://example.com",
          image: "image.png"
        }
      }

      recipe = Recipe.new(recipe_data, "thailand")

      expect(recipe).to be_a(Recipe)
      expect(recipe.id).to eq(recipe_data[:id])
      expect(recipe.title).to eq(recipe_data[:recipe][:label])
      expect(recipe.url).to eq(recipe_data[:recipe][:url])
      expect(recipe.image).to eq(recipe_data[:recipe][:image])
      expect(recipe.country).to eq("thailand")
    end
  end
end