require "rails_helper"

RSpec.describe PlacesService do
  describe "instance methods" do
    describe "#sites_by_lat_long" do
      it "returns data aboput sites based on lat long search" do
        VCR.use_cassette("france_country_sites") do
          sites = PlacesService.new.sites_by_lat_long([48.87, 2.33])

          expect(sites).to be_a(Hash)

          expect(sites[:features]).to be_an(Array)

          site_data = sites[:features].first

          expect(site_data).to have_key(:properties)
          expect(site_data[:properties]).to be_a(Hash)

          expect(site_data[:properties]).to have_key(:name)
          expect(site_data[:properties][:name]).to be_a(String)

          expect(site_data[:properties]).to have_key(:formatted)
          expect(site_data[:properties][:formatted]).to be_a(String)

          expect(site_data[:properties]).to have_key(:place_id)
          expect(site_data[:properties][:place_id]).to be_a(String)
        end
      end
    end
  end
end