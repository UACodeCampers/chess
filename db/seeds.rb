# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Game.create(id: 1, name: "Game with Richard", white_player_id: 1739)
Game.create(id: 2, name: "Game with Leila", white_player_id: 4862)
Game.create(id: 3, name: "Game with Bernadette", white_player_id: 2489)
Game.create(id: 4, name: "Game with Frank", white_player_id: 7935)
User.create(id: 1739, email: "richardtracy@yahoo.com")
User.create(id: 4862, email: "leilabenson@msn.com")
User.create(id: 2489, email: "bernunit@gmail.com")
User.create(id: 7935, email: "franklee@comcast.com")


player_one = User.create(
  email: "player_one@example.com", 
  name: "Barbera", 
  password: "password",
  encrypted_password: "password"
)

player_two = User.create(
  email: "player_two@example.com", 
  name: "Millie", 
  password: "password",
  encrypted_password: "password"
)

game_one = Game.create(
  name: "First game",
  white_player_id: player_one.id,
  black_player_id: player_two.id
)

black_rook = Piece.create(
  game_id = game_one.id,
  x_position = 1,
  y_position = 1,
  piece_type = "Rook",
  piece_color = "black"
)
