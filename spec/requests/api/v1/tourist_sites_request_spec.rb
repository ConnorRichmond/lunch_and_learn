require "rails_helper"

RSpec.describe "Tourist Sites Request" do
  describe "search for tourist sites" do
    it "returns tourist sites based on latitude-longitude the capital city that is provided by the user, happy path" do
      VCR.use_cassette("france_country_sites") do
        get "/api/v1/tourist_sites?country=France"

        expect(response).to be_successful

        tourist_sites = JSON.parse(response.body, symbolize_names: true)

        expect(tourist_sites).to have_key(:data)
        expect(tourist_sites[:data]).to be_an(Array)

        tourist_site = tourist_sites[:data].first

        expect(tourist_site).to have_key(:id)
        expect(tourist_site[:id]).to eq(nil)

        expect(tourist_site).to have_key(:type)
        expect(tourist_site[:type]).to be_a(String)
        expect(tourist_site[:type]).to eq("tourist_site")

        expect(tourist_site).to have_key(:attributes)
        expect(tourist_site[:attributes]).to be_a(Hash)

        expect(tourist_site[:attributes]).to have_key(:name)
        expect(tourist_site[:attributes][:name]).to be_a(String)

        expect(tourist_site[:attributes]).to have_key(:address)
        expect(tourist_site[:attributes][:address]).to be_a(String)

        expect(tourist_site[:attributes]).to have_key(:place_id)
        expect(tourist_site[:attributes][:place_id]).to be_a(String)
      end
    end

    it "returns tourist sites based on latitude-longitude the capital city that is provided by the user, sad path because antarctica doesn't have capital" do
      VCR.use_cassette("antarctica_country_sites") do
        get "/api/v1/tourist_sites?country=Antarctica"

        expect(response).to be_successful

        tourist_sites = JSON.parse(response.body, symbolize_names: true)

        expect(tourist_sites).to eq({
          data: []
        })
      end
    end

    it "returns tourist sites based on latitude-longitude the capital city that is provided by the user, sad path because uruguay doesn't have any sites" do
      VCR.use_cassette("uruguay_country_sites") do
        get "/api/v1/tourist_sites?country=Uruguay"

        expect(response).to be_successful

        tourist_sites = JSON.parse(response.body, symbolize_names: true)

        expect(tourist_sites).to eq({
          data: []
        })
      end
    end
  end
end