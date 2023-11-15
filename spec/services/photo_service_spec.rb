require "rails_helper"

RSpec.describe PhotoService do
  describe "instance methods" do
    describe "country photo" do
      it "returns photo data based on country search" do
        VCR.use_cassette("learning_resources_laos") do
          data = PhotoService.new.photo_by_country("laos")
          
          expect(data).to be_a(Hash)
          expect(data[:results]).to be_an(Array)
          
          photo_data = data[:results].first

          expect(photo_data).to be_a(Hash)

          expect(photo_data).to have_key(:id)
          expect(photo_data[:id]).to be_a(String)

          expect(photo_data).to have_key(:slug)
          expect(photo_data[:slug]).to be_a(String)

          expect(photo_data).to have_key(:created_at)
          expect(photo_data[:created_at]).to be_a(String)

          expect(photo_data).to have_key(:updated_at)
          expect(photo_data[:updated_at]).to be_a(String)

          expect(photo_data).to have_key(:promoted_at)
          
          expect(photo_data).to have_key(:width)
          expect(photo_data[:width]).to be_an(Integer)

          expect(photo_data).to have_key(:height)
          expect(photo_data[:height]).to be_an(Integer)

          expect(photo_data).to have_key(:color)
          expect(photo_data[:color]).to be_a(String)

          expect(photo_data).to have_key(:blur_hash)
          expect(photo_data[:blur_hash]).to be_a(String)

          expect(photo_data).to have_key(:description)
          expect(photo_data[:description]).to be_a(String)

          expect(photo_data).to have_key(:alt_description)
          expect(photo_data[:alt_description]).to be_a(String)

          expect(photo_data).to have_key(:breadcrumbs)
          expect(photo_data[:breadcrumbs]).to be_an(Array)

          expect(photo_data).to have_key(:urls)
          expect(photo_data[:urls]).to be_a(Hash)
        end
      end
    end
  end
end