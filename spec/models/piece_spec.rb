require 'rails_helper'

RSpec.describe Piece, type: :model do


  describe "is_obstructed?" do
  # let!(:user1) {FactoryBot.create :user}
  # let!(:user2) {FactoryBot.create :user}
  # let!(:game1) { User.new_game(id: 1, name: "game1", black_player_id: 3, white_player_id: 2)}
  # let!(:piece1) { Game.find(1).pieces.create(x_position: 5, y_position: 7, piece_type: "Pawn", color: "black", game_id: 1)}
  # let!(:piece2) { Game.find(1).pieces.create(x_position: 5, y_position: 4, piece_type: "Pawn", color: "black", game_id: 1)}
  # let!(:piece3) { Game.find(1).pieces.create(x_position: 5, y_position: 2, piece_type: "Pawn", color: "black", game_id: 1)}


    it "should detect upward vertical obstructions" do 
      piece = Piece.create(x_position:5, y_position: 2, piece_type: "Rook", color: "white", game_id: 1)
      piece2 = Piece.create(x_position: 5, y_position: 5, piece_type: "Rook", color: "black", game_id: 1)
      expect(piece.is_obstructed?(5, 1)).to be_falsey
    end 

    
    it "should detect downward vertical obstructions" do 
      piece = Piece.create(x_position: 5, y_position: 8, piece_type: "Rook", color: "white", game_id: 1)
      piece2 = Piece.create(x_position: 5, y_position: 7, piece_type: "Queen", color: "black", game_id: 1)
      expect(piece.is_obstructed?(5, 6)).to be_truthy
    end 

    it "should detect diagonal obstruction" do 
      piece = Piece.create(x_position: 5, y_position: 5, piece_type: "Bishop", color: "black", game_id: 1)
      piece2 = Piece.create(x_position: 7, y_position: 7, piece_type: "Pawn", color: "white", game_id: 1)
      expect(piece.is_obstructed?(8, 8)).to be_truthy 
    end 

    it "should detect diagonal obstruction" do 
      piece = Piece.create(x_position: 2, y_position: 2, piece_type: "Queen", color: "white", game_id: 1)
      piece2 = Piece.create(x_position: 1, y_position: 1, piece_type: "Pawn", color: "black", game_id: 1)
      expect(piece.is_obstructed?(4, 4)).to be_falsey
    end 

  end 
end
