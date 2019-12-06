require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe "valid_move?" do 
    
    it "should detect a valid move for a pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Pawn", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(4, 5)).to be_truthy
    end 

    it "should detect valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Pawn", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 5, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(4, 3)}.to raise_error(ArgumentError)
    end 

    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Pawn", color: "black", game_id: 4563)
      piece2 = Piece.create(x_position: 5, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(4, 5)}.to raise_error(ArgumentError)
    end 

    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, starting_position_x: 4, starting_position_y: 4, piece_type: "Pawn", color: "black", game_id: 4563)
      piece2 = Piece.create(x_position: 5, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(4, 2)).to be_truthy
    end 

    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, starting_position_x: 4, starting_position_y: 4, piece_type: "Pawn", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 5, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(4, 6)).to be_truthy
    end 

    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, starting_position_x: 4, starting_position_y: 4, piece_type: "Pawn", color: "black", game_id: 4563)
      piece2 = Piece.create(x_position: 4, y_position: 3, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(4, 3)}.to raise_error(ArgumentError)
    end 

    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, starting_position_x: 4, starting_position_y: 4, piece_type: "Pawn", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 4, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(4, 5)}.to raise_error(ArgumentError)
    end 
    
    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, starting_position_x: 4, starting_position_y: 4, piece_type: "Pawn", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 5, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(5, 5)).to be_truthy
    end 

    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, starting_position_x: 4, starting_position_y: 4, piece_type: "Pawn", color: "black", game_id: 4563)
      piece2 = Piece.create(x_position: 3, y_position: 3, piece_type: "Pawn", color: "white", game_id: 4563)
      expect(piece.valid_move?(3, 3)).to be_truthy
    end 

    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, starting_position_x: 4, starting_position_y: 4, piece_type: "Pawn", color: "black", game_id: 4563)
      piece2 = Piece.create(x_position: 3, y_position: 3, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(3, 3)}.to raise_error(ArgumentError)
    end 

    it "should detect a valid move for Pawn" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, starting_position_x: 4, starting_position_y: 4, piece_type: "Pawn", color: "black", game_id: 4563)
      piece2 = Piece.create(x_position: 3, y_position: 3, piece_type: "Pawn", color: "white", game_id: 4563)
      expect{piece.valid_move?(8, 8)}.to raise_error(ArgumentError)
    end 
  end 
end
