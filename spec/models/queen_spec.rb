require 'rails_helper'

RSpec.describe Queen, type: :model do
  
  describe "valid_move?" do
    it "should detect valid move for queen" do
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Queen", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(4, 8)).to be_truthy
    end 

    it "should detect valid move for queen" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Queen", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(3, 3)).to be_truthy
    end 

    
    it "should detect valid move for queen" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Queen", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect(piece.valid_move?(4, 8)).to be_truthy
    end 


    it "should detect valid move for queen do" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Queen", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 1, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(10, 3)}.to raise_error(ArgumentError)
    end 
    
    it "should detect valid move for queen do" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Queen", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 4, y_position: 7, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(4, 8)}.to raise_error(ArgumentError)
    end 
    
    it "should detect valid move for queen do" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Queen", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 4, y_position: 6, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(4, 8)}.to raise_error(ArgumentError)
    end 
    
    it "should detect valid move for queen do" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 4, y_position: 4, piece_type: "Queen", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 5, y_position: 5, piece_type: "Pawn", color: "black", game_id: 4563)
      expect{piece.valid_move?(6, 6)}.to raise_error(ArgumentError)
    end 
  end  
end