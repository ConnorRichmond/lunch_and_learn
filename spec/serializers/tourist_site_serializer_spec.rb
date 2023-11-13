require "rails_helper"

RSpec.describe TouristSiteSerializer do
  it "should serialize tourist sites" do
    tourist_site_data = {
        properties: {
          name: "Eiffel Tower",
          formatted: "1234 Eiffel Tower Road",
          place_id: "place_id"
        }
      }

      tourist_site = TouristSite.new(tourist_site_data)

      serialized_data = TouristSiteSerializer.new(tourist_site).serializable_hash

      expect(serialized_data).to eq(
        {
          data: {
            id: nil,
            type: :tourist_site,
            attributes: {
              name: tourist_site.name,
              address: tourist_site.address,
              place_id: tourist_site.place_id
            }
          }
        }
      )
  end
end