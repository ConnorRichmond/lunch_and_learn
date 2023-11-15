require "rails_helper"

describe "Recipe API" do
  it "sends recipes based on a given country type" do
    VCR.use_cassette("thailand_recipe_search") do
      get "/api/v1/recipes", params: {country: "thailand"}

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      recipes = json[:data]

      expect(recipes).to be_an(Array)

      recipes.each do |recipe|
        expect(recipe).to have_key(:id)
        expect(recipe[:id]).to eq(nil)

        expect(recipe).to have_key(:type)
        expect(recipe[:type]).to eq("recipe")

        expect(recipe[:attributes]).to have_key(:title)
        expect(recipe[:attributes][:title]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:url)
        expect(recipe[:attributes][:url]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes][:country]).to be_a(String)

        expect(recipe[:attributes]).to have_key(:country)
        expect(recipe[:attributes][:country]).to be_a(String)
        expect(recipe[:attributes][:country]).to eq("thailand")

        expect(recipe[:attributes]).to have_key(:image)
        expect(recipe[:attributes][:image]).to be_a(String)

        expect(recipe).to_not have_key(:uri)
        expect(recipe[:attributes]).to_not have_key(:uri)

        expect(recipe).to_not have_key(:images)
        expect(recipe[:attributes]).to_not have_key(:images)

        expect(recipe).to_not have_key(:source)
        expect(recipe[:attributes]).to_not have_key(:source)

        expect(recipe).to_not have_key(:shareAs)
        expect(recipe[:attributes]).to_not have_key(:shareAs)

        expect(recipe).to_not have_key(:yield)
        expect(recipe[:attributes]).to_not have_key(:yield)

        expect(recipe).to_not have_key(:dietLabels)
        expect(recipe[:attributes]).to_not have_key(:dietLabels)

        expect(recipe).to_not have_key(:dietLabels)
        expect(recipe[:attributes]).to_not have_key(:dietLabels)

        expect(recipe).to_not have_key(:healthLabels)
        expect(recipe[:attributes]).to_not have_key(:healthLabels)

        expect(recipe).to_not have_key(:cautions)
        expect(recipe[:attributes]).to_not have_key(:cautions)

        expect(recipe).to_not have_key(:ingredientLines)
        expect(recipe[:attributes]).to_not have_key(:ingredientLines)

        expect(recipe).to_not have_key(:ingredients)
        expect(recipe[:attributes]).to_not have_key(:ingredients)
      end
    end
  end

  it "returns blank data key if passed an empty country param" do
    VCR.use_cassette("empty string/blank country") do
      get "/api/v1/recipes"

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to eq({
        "data": []
      })
    end
  end

  it "returns blank data key if country doesn't have recipes" do
    VCR.use_cassette("search_falkland_islands") do
      get "/api/v1/recipes", params: {country: "Falkland Islands"}

      expect(response).to be_successful

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to eq({
        "data": []
      })
    end
  end

  it "uses a random country when country param is 'random_choice'" do
    VCR.use_cassette("random_country", :record => :new_episodes) do
      get "/api/v1/recipes", params: {country: "random_choice"}

      expect(response).to be_successful
    end
  end
end