require "rails_helper"

RSpec.describe PlacesFacade do
  describe "instance methods" do
    describe "#sites_by_lat_long" do
      it "returns sites based on lat long coordinates" do
        VCR.use_cassette("france_country_sites") do
          sites = PlacesFacade.new.sites_by_lat_long([48.87, 2.33])

          expect(sites).to be_an(Array)

          site = sites.first

          expect(site).to be_a(TouristSite)
          expect(site.address).to be_a(String)
          expect(site.name).to be_a(String)
          expect(site.place_id).to be_a(String)
        end
      end
    end
  end
end