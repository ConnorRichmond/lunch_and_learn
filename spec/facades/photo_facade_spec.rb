require "rails_helper"

RSpec.describe PhotoFacade do
  describe "instance methods" do
    describe "#photo_by_country" do
      it "returns photo objects by country search" do
        VCR.use_cassette("learning_resources_laos") do
          photos = PhotoFacade.new.photo_by_country("laos")

          

          expect(photos).to be_an(Array)

          photo = photos.first
          
          expect(photo.alt_tag).to be_a(String)
          expect(photo.url).to be_a(String)
        end
      end

      it "returns an empty object if country returns no images" do
        VCR.use_cassette("no_media_search") do
          photos = PhotoFacade.new.photo_by_country("thisisnotacountry")

          expect(photos).to eq([])
        end
      end
    end
  end
end