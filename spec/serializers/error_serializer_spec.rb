require "rails_helper"

RSpec.describe ErrorSerializer do
  it "returns error" do
    error_message = ErrorMessage.new("Your email is already taken.", 404)

    serialized_data = ErrorSerializer.new(error_message).serialize_json
    
    expect(serialized_data).to eq(
      {
        errors: [
          {
            status: "404",
            title: "Your email is already taken."
          }
        ]
      }
    )
  end
end