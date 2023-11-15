require "rails_helper"

RSpec.describe UserSerializer do
  it "should serialize user" do
    user_data = {
      name: "user",
      email: "user@gmail.com",
      password: "1234",
      password_confirmation: "1234",
      api_key: "1234"
    }

    user = User.create(user_data)

    serialized_data = UserSerializer.new(user).serializable_hash

    expect(serialized_data).to eq(
      {
        data: {
          id: user.id.to_s,
          type: :user,
          attributes: {
            name: user.name,
            email: user.email,
            api_key: user.api_key
          }
        }
      }
    )
  end
end