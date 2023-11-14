require "rails_helper"

RSpec.describe LearningResourceSerializer do
  it "should serialize learning resource" do
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

      serialized_data = LearningResourceSerializer.new(learning_resource).serializable_hash

      expect(serialized_data).to eq(
        {
          data: {
            id: nil,
            type: :learning_resource,
            attributes: {
              country: "thailand",
              video: learning_resource.video,
              images: learning_resource.images
            }
          }
        }
      )
  end
end