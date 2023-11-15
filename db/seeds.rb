user1 = User.create(
  name: "user1",
  email: "user1@gmail.com",
  password: "1234",
  api_key: "1234"
)

user2 = User.create(
  name: "user2",
  email: "user2@gmail.com",
  password: "1234",
  api_key: "4321"
)

user.favorites.create(
  country: "country 1",
  recipe_link: "https://recipe_link_1.com",
  recipe_title: "recipe 1"
)

user.favorites.create(
  country: "country 2",
  recipe_link: "https://recipe_link_2.com",
  recipe_title: "recipe 2"
)
