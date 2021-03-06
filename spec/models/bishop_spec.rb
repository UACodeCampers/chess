require 'rails_helper'

RSpec.describe Bishop, type: :model do
  
  describe "valid_move?" do 
    it "should detect a valid move for bishop" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 2, piece_type: "Bishop", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 8, y_position: 5, piece_type: "Rook", color: "black", game_id: 4563)
      expect(piece.valid_move?(6, 3)).to be_truthy
    end 

    it "should detect a valid move for bishop" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 2, piece_type: "Bishop", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 8, y_position: 5, piece_type: "Rook", color: "black", game_id: 4563)
      expect{piece.valid_move?(1, 8)}.to raise_error(ArgumentError)
    end 

    it "should detect a valid move for bishop" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 2, piece_type: "Bishop", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 8, y_position: 5, piece_type: "Rook", color: "black", game_id: 4563)
      expect(piece.valid_move?(8, 5)).to be_truthy
    end 

    it "should detect a valid move for bishop" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 5, y_position: 2, piece_type: "Bishop", color: "white", game_id: 4563)
      piece2 = Piece.create(x_position: 7, y_position: 4, piece_type: "Rook", color: "black", game_id: 4563)
      expect{piece.valid_move?(8, 5)}.to raise_error(ArgumentError)
    end 
  end 
end