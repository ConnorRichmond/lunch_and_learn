require "rails_helper"

RSpec.describe VideoFacade do
  describe "instance methods" do
    describe "#video_by_country" do
      it "returns a video based on country" do
        VCR.use_cassette("learn_about_thailand") do
          video = VideoFacade.new.video_by_country("thailand")

          expect(video).to be_a(Video)
          expect(video.title).to be_a(String)
          expect(video.youtube_video_id).to be_a(String)
        end
      end

      it "returns empty if no videos based on country" do
        VCR.use_cassette("bad_search") do
          video = VideoFacade.new.video_by_country("atropia")

          expect(video).to eq({})
        end
      end
    end
  end
end