require 'rails_helper'

RSpec.describe Piece, type: :model do

  describe "is_obstructed?" do
    it "should detect upward vertical obstructions" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position:5, y_position: 2, piece_type: "Rook", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 5, y_position: 5, piece_type: "Rook", color: "black", game_id: 4563)
      expect(piece.is_obstructed?(5, 1)).to be_falsey
    end 
    
    it "should detect downward vertical obstructions" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 8, piece_type: "Rook", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 5, y_position: 7, piece_type: "Queen", color: "black", game_id: 4563)
      expect(piece.is_obstructed?(5, 6)).to be_truthy
    end 

    it "should detect diagonal obstruction" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 5, piece_type: "Bishop", color: "black", game_id: 4563)
      piece2 = Piece.create(x_position: 7, y_position: 7, piece_type: "Pawn", color: "white", game_id: 4563)
      expect(piece.is_obstructed?(8, 8)).to be_truthy 
    end 

    it "should detect diagonal obstruction" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 2, y_position: 2, piece_type: "Queen", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 1, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.is_obstructed?(4, 4)).to be_falsey
    end 
  end 
end