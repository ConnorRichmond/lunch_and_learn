require "rails_helper"

RSpec.describe RecipeSerializer do
  it "should serailize recipes" do
    recipe_data = {
      recipe: {
        label: "a recipe",
        url: "https.example.com",
        image: "image.png"
      }
    }

    recipe = Recipe.new(recipe_data, "thailand")

    serialized_data = RecipeSerializer.new(recipe).serializable_hash

    expect(serialized_data).to eq(
      {
        data: {
          id: nil,
          type: :recipe,
          attributes: {
            title: recipe_data[:recipe][:label],
            url: recipe_data[:recipe][:url],
            country: "thailand",
            image: recipe_data[:recipe][:image]
          }
        }
      }
    )
  end
end