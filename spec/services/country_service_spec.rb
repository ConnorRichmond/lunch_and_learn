require "rails_helper"

RSpec.describe CountryService do
  describe "instance methods" do
    describe "#random_country" do
      it "returns all country data" do
        VCR.use_cassette("random_country") do
          response = CountryService.new.random_country

          expect(response).to be_an(Array)

          country_data = response.first

          expect(country_data).to have_key(:name)
          expect(country_data[:name]).to be_a(Hash)

          expect(country_data[:name]).to have_key(:common)
          expect(country_data[:name][:common]).to be_a(String)

          expect(country_data[:name]).to have_key(:official)
          expect(country_data[:name][:official]).to be_a(String)

          expect(country_data[:name]).to have_key(:nativeName)
          expect(country_data[:name][:nativeName]).to be_a(Hash)
        end
      end
    end
  end
end