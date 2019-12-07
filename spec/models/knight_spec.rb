require 'rails_helper'

RSpec.describe Knight, type: :model do

  describe "valid_move?" do 
    it "should detect valid move for knight" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Knight", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(6, 5)).to be_truthy
    end

    it "should detect valid move for knight" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Knight", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(6, 3)).to be_truthy
    end

    it "should detect valid move for knight" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Knight", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(6, 6)}.to raise_error(ArgumentError)
    end

    it "should detect valid move for knight" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Knight", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(3, 6)).to be_truthy
    end

    it "should detect valid move for knight" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Knight", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(5, 6)).to be_truthy
    end

    it "should detect valid move for knight" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Knight", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(3, 7)}.to raise_error(ArgumentError)
    end

    it "should detect valid move for knight" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Knight", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(10, 10)}.to raise_error(ArgumentError)
    end
  end 
end