require "rails_helper"

RSpec.describe Photo do
  describe "#initialize" do
    it "returns a photo object" do
      photo_data = {
        description: "alt tag description",
        urls: {
          raw: "image.png"
        }
      }

      photo = Photo.new(photo_data)

      expect(photo).to be_a(Photo)
      expect(photo.alt_tag).to eq("alt tag description")
      expect(photo.url).to eq("image.png")
    end
  end
end