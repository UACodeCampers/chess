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

<<<<<<< HEAD
  describe "occupied?" do
    let!(:user1) {FactoryBot.create :user}
    let!(:user2) {FactoryBot.create :user}
    let!(:game1) {FactoryBot.create :game}
    let!(:piece1) { game1.pieces.create(x_position: 5, y_position: 7, piece_type: "Pawn", color: "black")}
    
    it "should detect whether a piece exists in the move_to space" do
      expect(piece1.occupied?(5, 7)).to be_truthy
    end
    
    it "should detect when a space is not occupied" do
      expect(piece1.occupied?(8, 8)).to be_falsey
    end
  end
  
=======
  describe "self_check?" do 
    it "checks to see if player move puts king in check" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 3, piece_type: "King", color: "white", game_id: 4563, captured?: false)
      piece2 = Piece.create(x_position: 2, y_position: 3, piece_type: "Rook", color: "white", game_id: 4563, captured?: false)
      piece3 = Piece.create(x_position: 3, y_position: 3, piece_type: "Rook", color: "black", game_id: 4563, captured?: false)
      expect(piece2.self_check?(2, 5)).to be_truthy
    end 

    it "checks to see if player move puts king in check" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 3, piece_type: "King", color: "white", game_id: 4563, captured?: false)
      piece2 = Piece.create(x_position: 2, y_position: 3, piece_type: "Rook", color: "white", game_id: 4563, captured?: false)
      piece3 = Piece.create(x_position: 3, y_position: 3, piece_type: "Rook", color: "black", game_id: 4563, captured?: false)
      expect(piece.self_check?(2, 4)).to be_falsey
    end 
  end 

>>>>>>> finishing self_check? method
end