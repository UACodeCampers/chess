require 'rails_helper'

RSpec.describe Rook, type: :model do
  
  describe "valid_move?" do 
    it "should detect valid move for rook" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 1, piece_type: "Rook", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(6, 6)}.to raise_error(ArgumentError)
    end 

    it "should detect valid move for rook" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 1, piece_type: "Rook", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(1, 5)).to be_truthy
    end 

    it "should detect valid move for rook" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 1, piece_type: "Rook", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(1, 6)}.to raise_error(ArgumentError)
    end 

    it "should detect valid move for rook" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 1, piece_type: "Rook", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(5, 1)).to be_truthy
    end 

    it "should detect valid move for rook" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 1, piece_type: "Rook", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(1, 7)}.to raise_error(ArgumentError)
    end 
  end 
end