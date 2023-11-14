require "rails_helper"

RSpec.describe ErrorMessage do
  describe "#initialize" do
    it "creates an error message object" do
      error_message = ErrorMessage.new("This is an error message.", 404)

      expect(error_message).to be_a(ErrorMessage)
      expect(error_message.message).to eq("This is an error message.")
      expect(error_message.status_code).to eq(404)
    end
  end
end