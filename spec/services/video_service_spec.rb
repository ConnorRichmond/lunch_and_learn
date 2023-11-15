require "rails_helper"


RSpec.describe VideoService do
  describe "instance methods" do
    describe "country video" do
      it "should return data of videos by country" do
        VCR.use_cassette("video_for_thailand") do
          response = VideoService.new.video_by_country("thailand")

          video_data = response[:items].first

          expect(video_data).to be_a(Hash)
          
          expect(video_data).to have_key(:kind)
          expect(video_data[:kind]).to be_a(String)

          expect(video_data).to have_key(:etag)
          expect(video_data[:etag]).to be_a(String)

          expect(video_data).to have_key(:id)
          expect(video_data[:id]).to be_a(Hash)
          expect(video_data[:id]).to have_key(:kind)
          expect(video_data[:id][:kind]).to be_a(String)
          expect(video_data[:id]).to have_key(:videoId)
          expect(video_data[:id][:videoId]).to be_a(String)

          expect(video_data).to have_key(:snippet)
          expect(video_data[:snippet]).to be_a(Hash)

          expect(video_data[:snippet]).to have_key(:publishedAt)
          expect(video_data[:snippet][:publishedAt]).to be_a(String)

          expect(video_data[:snippet]).to have_key(:channelId)
          expect(video_data[:snippet][:channelId]).to be_a(String)

          expect(video_data[:snippet]).to have_key(:title)
          expect(video_data[:snippet][:title]).to be_a(String)

          expect(video_data[:snippet]).to have_key(:description)
          expect(video_data[:snippet][:description]).to be_a(String)
          
          expect(video_data[:snippet]).to have_key(:thumbnails)
          expect(video_data[:snippet][:thumbnails]).to be_a(Hash)

          expect(video_data[:snippet]).to have_key(:channelTitle)
          expect(video_data[:snippet][:channelTitle]).to be_a(String)

          expect(video_data[:snippet]).to have_key(:liveBroadcastContent)
          expect(video_data[:snippet][:liveBroadcastContent]).to be_a(String)

          expect(video_data[:snippet]).to have_key(:publishTime)
          expect(video_data[:snippet][:publishTime]).to be_a(String)
        end
      end
    end
  end
end