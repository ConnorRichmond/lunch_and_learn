require "rails_helper"

RSpec.describe TouristSite do
  describe "#initialize" do
    it "returns a tourist site object" do
      tourist_site_data = {
        properties: {
          name: "Eiffel Tower",
          formatted: "1234 Eiffel Tower Road",
          place_id: "place_id"
        }
      }

      tourist_site = TouristSite.new(tourist_site_data)

      expect(tourist_site).to be_a(TouristSite)
      expect(tourist_site.id).to eq(nil)
      expect(tourist_site.name).to eq(tourist_site_data[:properties][:name])
      expect(tourist_site.address).to eq(tourist_site_data[:properties][:formatted])
      expect(tourist_site.place_id).to eq(tourist_site_data[:properties][:place_id])
    end
  end
end