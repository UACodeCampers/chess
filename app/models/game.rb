class Game < ApplicationRecord
  has_many :pieces

  belongs_to :black_player, class_name: 'User', foreign_key: 'black_player_id', optional: true 
  belongs_to :white_player, class_name: 'User', foreign_key: 'white_player_id', optional: true

  after_create :populate_game!
  
  def self.available 
    where(black_player_id: nil).or(where(white_player_id: nil))
  end 

  def check_present?
    kings = Game.find(self.id).pieces.where( 
      piece_type: "King",
    )
    kings.find_each do |king| 
      return true if king.check?(king.x_position, king.y_position)
    end 
    return false
  end 
  
  def contains_piece?(x_coord, y_coord)
    if pieces.where("(starting_position_x = ? AND starting_position_y = ?)", x_coord, y_coord).any?
      return true
    else
      return false
    end
  end

    #Puts pieces in their starting positions after a game is created
    def populate_game!  
    #WHITE PIECES
      (1..8).each do |x_position|
      Pawn.create(game_id: id, starting_position_x: x_position, starting_position_y: 2, color: "white", piece_type: "Pawn") 
      end

      Rook.create(game_id: id, starting_position_x: 1, starting_position_y: 1, color: "white", piece_type: "Rook")
      Rook.create(game_id: id, starting_position_x: 8, starting_position_y: 1, color: "white", piece_type: "Rook")
      Knight.create(game_id: id, starting_position_x: 2, starting_position_y: 1, color: "white", piece_type: "Knight")
      Knight.create(game_id: id, starting_position_x: 7, starting_position_y: 1, color: "white", piece_type: "Knight")
      Bishop.create(game_id: id, starting_position_x: 3, starting_position_y: 1, color: "white", piece_type: "Bishop")
      Bishop.create(game_id: id, starting_position_x: 6, starting_position_y: 1,  color: "white", piece_type: "Bishop")
      Queen.create(game_id: id, starting_position_x: 4, starting_position_y: 1, color: "white", piece_type: "Queen")
      King.create(game_id: id, starting_position_x: 5, starting_position_y: 1, color: "white", piece_type: "King")
    

    #BLACK PIECES
      (1..8).each do |x_position|
      Pawn.create(game_id: id, starting_position_x: x_position, starting_position_y: 7, color: "black", piece_type: "Pawn") 
      end
      Rook.create(game_id: id, starting_position_x: 1, starting_position_y: 8, color: "black", piece_type: "Rook")
      Rook.create(game_id: id, starting_position_x: 8, starting_position_y: 8, color: "black", piece_type: "Rook")
      Knight.create(game_id: id, starting_position_x: 2, starting_position_y: 8, color: "black", piece_type: "Knight")
      Knight.create(game_id: id, starting_position_x: 7, starting_position_y: 8, color: "black", piece_type: "Knight")
      Bishop.create(game_id: id, starting_position_x: 3, starting_position_y: 8, color: "black", piece_type: "Bishop")
      Bishop.create(game_id: id, starting_position_x: 6, starting_position_y: 8,  color: "black", piece_type: "Bishop")
      Queen.create(game_id: id, starting_position_x: 4, starting_position_y: 8, color: "black", piece_type: "Queen")
      King.create(game_id: id, starting_position_x: 5, starting_position_y: 8, color: "black", piece_type: "King")
    end
end