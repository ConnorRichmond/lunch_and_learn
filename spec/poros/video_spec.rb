require "rails_helper"

RSpec.describe Video do
  describe "#initialize" do
    it "returns a video object" do
      video_data = {
        snippet: {
          title: "video title"
        },
        id: {
          videoId: "video id"
        }
      }

      video = Video.new(video_data)

      expect(video).to be_a(Video)
      expect(video.title).to eq("video title")
      expect(video.youtube_video_id).to eq("video id")
    end
  end
end