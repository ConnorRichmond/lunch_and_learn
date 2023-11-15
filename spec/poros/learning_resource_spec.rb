require "rails_helper"

RSpec.describe LearningResource do
  describe "#initialize" do
    it "returns a learning resource object" do
      video = Video.new({
        snippet: {
          title: "video title"
        },
        id: {
          videoId: "a video id"
        }
      })

      images = [
        Photo.new({
          description: "an image description",
          urls: {
            raw: "image.png"
          }
        })
      ]

      learning_resource = LearningResource.new("thailand", video, images)

      expect(learning_resource).to be_a(LearningResource)
      expect(learning_resource.id).to eq(nil)
      expect(learning_resource.country).to eq("thailand")

      expect(learning_resource.video.title).to eq("video title")
      expect(learning_resource.video.youtube_video_id).to eq("a video id")

      expect(learning_resource.images).to be_an(Array)
      expect(learning_resource.images.first.alt_tag).to eq("an image description")
      expect(learning_resource.images.first.url).to eq("image.png")
    end
  end
end