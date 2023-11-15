require "rails_helper"

RSpec.describe FavoriteSerializer do
  it "should serialize favorite" do
    user = User.create(name: "user", email: "user@gmail.com", password: "1234", api_key: "1234")
    favorite_1 = user.favorites.create(country: "thailand", recipe_link: "https://www.seriouseats.com/recipes/2013/11/andy-rickers-naam-cheuam-naam-taan-piip-palm-sugar-simple-syrup.html", recipe_title: "Andy Ricker's Naam Cheuam Naam Taan Piip (Palm Sugar Simple Syrup)")

    serialized_data = FavoriteSerializer.new(favorite_1).serializable_hash

    expect(serialized_data).to eq(
      {
        data: {
          id: favorite_1.id.to_s,
          type: :favorite,
          attributes: {
            recipe_title: favorite_1.recipe_title,
            recipe_link: favorite_1.recipe_link,
            country: favorite_1.country,
            created_at: favorite_1.created_at
          }
        }
      }
    )
  end
end