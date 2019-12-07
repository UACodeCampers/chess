require 'rails_helper'

RSpec.describe King, type: :model do
  
  describe "valid_move?" do 
    it "should detect valid move for king" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 2, piece_type: "King", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 8, y_position: 5, piece_type: "Rook", color: "black", game_id: 4563)
      expect{piece.valid_move?(6, 6)}.to raise_error(ArgumentError)
    end 

    it "should detect valid move for king" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 2, piece_type: "King", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 8, y_position: 5, piece_type: "Rook", color: "black", game_id: 4563)
      expect(piece.valid_move?(6, 3)).to be_truthy
    end 

    it "should detect valid move for king" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 2, piece_type: "King", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 8, y_position: 5, piece_type: "Rook", color: "black", game_id: 4563)
      expect{piece.valid_move?(1, 1)}.to raise_error(ArgumentError)
    end 

    it "should detect valid move for king" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 7, y_position: 4, piece_type: "King", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 8, y_position: 5, piece_type: "Rook", color: "black", game_id: 4563)
      expect(piece.valid_move?(8, 5)).to be_truthy
    end 
  end 

  describe "check?" do
    it "should detect if a King is in check" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 6, y_position: 5, piece_type: "King", color: "white", game_id: 4563, captured?: "false")
      piece2 = Piece.create(x_position: 2, y_position: 2, piece_type: "Rook", color: "black", game_id: 4563, captured?: "false")
      piece3 = Piece.create(x_position: 4, y_position: 1, piece_type: "Bishop", color: "black", game_id: 4563, captured?: "false")
      expect(piece.check?(7, 4)).to be_truthy
    end 

    it "should detect valid move for king" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 3, y_position: 3, piece_type: "King", color: "white", game_id: 4563, captured?: "false")
      piece2 = Piece.create(x_position: 4, y_position: 1, piece_type: "Rook", color: "black", game_id: 4563, captured?: "false")
      expect(piece.check?(4, 3)).to be_truthy
    end 

  end 
end