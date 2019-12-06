require 'rails_helper'

RSpec.describe Piece, type: :model do


  describe "is_obstructed?" do
  let!(:user1) {FactoryBot.create :user}
  let!(:user2) {FactoryBot.create :user}
  let!(:game1) { Game.create(id: 1, name: "game1", black_player_id: 3, white_player_id: 2)}
  let!(:piece1) { Game.find(1).pieces.create(x_position: 5, y_position: 7, piece_type: "Pawn", color: "black", game_id: 1)}
  let!(:piece2) { Game.find(1).pieces.create(x_position: 5, y_position: 3, piece_type: "Pawn", color: "black", game_id: 1)}
  let!(:piece3) { Game.find(1).pieces.create(x_position: 5, y_position: 2, piece_type: "Pawn", color: "black", game_id: 1)}


    it "should detect downward vertical obstructions" do 
      piece = Piece.new(x_position: 5, y_position: 5, piece_type: "Rook", color: "black", game_id: 1)
      expect(piece.is_obstructed?(5, 3)).to be_falsey
    end 

    
    it "should detect downward vertical obstructions" do 
      piece = Piece.new(x_position: 5, y_position: 5, piece_type: "Rook", color: "white", game_id: 1)
      expect(piece.is_obstructed?(5, 2)).to be_truthy
    end 


  end 

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
end
