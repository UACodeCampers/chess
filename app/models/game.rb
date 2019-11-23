class Game < ApplicationRecord
  has_many :pieces

  after_create :populate_game!

  belongs_to :black_player, class_name: 'User', foreign_key: 'black_player_id'
  belongs_to :white_player, class_name: 'User', foreign_key: 'white_player_id'
    def self.available 
        where(black_player_id: nil).or(where(white_player_id: nil))
    end 

  def populate_game!
      
  #WHITE PIECES
    Pawn.create(1..8).each do |i| Pawn.create(game_id: id, starting_position_x: 'i', starting_position_y: 1, color: white, user_id: white_player_id, piece_type: Pawn) end
    Rook.create(game_id: id, starting_position_x: 0, starting_position_y: 0, color: white, user_id: white_player_id, piece_type: Rook)
    Rook.create(game_id: id, starting_position_x: 0, starting_position_y: 7, color: white, user_id: white_player_id, piece_type: Rook)
    Knight.create(game_id: id, starting_position_x: 1, starting_position_y: 0, color: white, user_id: white_player_id, piece_type: Knight)
    Knight.create(game_id: id, starting_position_x: 6, starting_position_y: 0, color: white, user_id: white_player_id, piece_type: Knight)
    Bishop.create(game_id: id, starting_position_x: 2, starting_position_y: 0, color: white, user_id: white_player_id, piece_type: Bishop)
    Bishop.create(game_id: id, starting_position_x: 5, starting_position_y: 0,  color: white, user_id: white_player_id, piece_type: Bishop)
    Queen.create(game_id: id, starting_position_x: 3, starting_position_y: 0, color: white, user_id: white_player_id, piece_type: Queen)
    King.create(game_id: id, starting_position_x: 4, starting_position_y: 0, color: white, user_id: white_player_id, piece_type: King)
  

#BLACK PIECES
    Pawn.create(1..8).each do |i| Pawn.create(game_id: id, starting_position_x: 'i', starting_position_y: 7, color: white, user_id: white_player_id, piece_type: Pawn) end
    Rook.create(game_id: id, starting_position_x: 0, starting_position_y: 7, color: white, user_id: white_player_id, piece_type: Rook)
    Rook.create(game_id: id, starting_position_x: 7, starting_position_y: 7, color: white, user_id: white_player_id, piece_type: Rook)
    Knight.create(game_id: id, starting_position_x: 1, starting_position_y: 7, color: white, user_id: white_player_id, piece_type: Knight)
    Knight.create(game_id: id, starting_position_x: 6, starting_position_y: 7, color: white, user_id: white_player_id, piece_type: Knight)
    Bishop.create(game_id: id, starting_position_x: 2, starting_position_y: 7, color: white, user_id: white_player_id, piece_type: Bishop)
    Bishop.create(game_id: id, starting_position_x: 5, starting_position_y: 7,  color: white, user_id: white_player_id, piece_type: Bishop)
    Queen.create(game_id: id, starting_position_x: 3, starting_position_y: 7, color: white, user_id: white_player_id, piece_type: Queen)
    King.create(game_id: id, starting_position_x: 4, starting_position_y: 7, color: white, user_id: white_player_id, piece_type: King)
end
