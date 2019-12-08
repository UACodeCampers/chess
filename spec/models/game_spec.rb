require 'rails_helper'

RSpec.describe Game, type: :model do
  describe "check_present?" do 
   
    it "should detect downward vertical obstructions" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 7, piece_type: "King", color: "white", game_id: 4563, captured?: false)
      piece2 = Piece.create(x_position: 5, y_position: 7, piece_type: "Queen", color: "black", game_id: 4563, captured?: false)
      expect(game1.check_present?).to be_truthy
    end 

    it "should detect downward vertical obstructions" do 
      user1 = User.create(id: 3, name: "David", email: "richardtracy@yahoo.com", password: "123456")
      game1 = Game.create(id: 4563, name: "Game with tim", white_player_id: user1.id)
      piece = Piece.create(x_position: 1, y_position: 7, piece_type: "King", color: "white", game_id: 4563, captured?: false)
      piece2 = Piece.create(x_position: 5, y_position: 1, piece_type: "Queen", color: "black", game_id: 4563, captured?: false)
      expect(game1.check_present?).to be_falsey
    end 

  end 
end