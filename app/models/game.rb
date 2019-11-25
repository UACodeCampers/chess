class Game < ApplicationRecord
has_many :pieces
	belongs_to :user
	after_create :populate_game!
	scope :available, -> { where(black_player_id: nil) }
    def self.available 
        where(black_player_id: nil).or(where(white_player_id: nil))
    end 

def populate_game!
      
   #WHITE PIECES
(1..8).each do |x_position|
     Pawn.create(game_id: id, x_position: x_position, y_position: 2, starting_position_x: x_position, starting_position_y: 1, color: "white", piece_type: "Pawn", html_code: "&#9817;") 
 end
 
     Rook.create(game_id: id, starting_position_x: 1, starting_position_y: 1, color: "white", piece_type: "Rook", html_code: "&#9814;")
     Rook.create(game_id: id, starting_position_x: 1, starting_position_y: 8, color: "white", piece_type: "Rook", html_code: "&#9814;")
     Knight.create(game_id: id, starting_position_x: 2, starting_position_y: 2, color: "white", piece_type: "Knight", html_code: "&#9816;")
     Knight.create(game_id: id, starting_position_x: 7, starting_position_y: 1, color: "white", piece_type: "Knight", html_code: "&#9816;")
     Bishop.create(game_id: id, starting_position_x: 3, starting_position_y: 1, color: "white", piece_type: "Bishop", html_code: "&#9815;")
     Bishop.create(game_id: id, starting_position_x: 6, starting_position_y: 1,  color: "white", piece_type: "Bishop", html_code: "&#9815;")
     Queen.create(game_id: id, starting_position_x: 4, starting_position_y: 1, color: "white", piece_type: "Queen", html_code: "&#9813;")
     King.create(game_id: id, starting_position_x: 5, starting_position_y: 1, color: "white", piece_type: "King", html_code: "&#9812;")
  

# #BLACK PIECES
(1..8).each do |x_position|
     Pawn.create(game_id: id, starting_position_x: x_position, starting_position_y: 7, color: "white", piece_type: "Pawn", html_code: "&#9823;") 
 end
     Rook.create(game_id: id, starting_position_x: 1, starting_position_y: 8, color: "white", piece_type: "Rook", html_code: "&#9820;")
     Rook.create(game_id: id, starting_position_x: 8, starting_position_y: 8, color: "white", piece_type: "Rook", html_code: "&#9820;")
     Knight.create(game_id: id, starting_position_x: 2, starting_position_y: 8, color: "white", piece_type: "Knight", html_code: "&#9822;")
     Knight.create(game_id: id, starting_position_x: 7, starting_position_y: 8, color: "white", piece_type: "Knight", html_code: "&#9822;")
     Bishop.create(game_id: id, starting_position_x: 3, starting_position_y: 8, color: "white", piece_type: "Bishop", html_code: "&#9821;")
     Bishop.create(game_id: id, starting_position_x: 6, starting_position_y: 8,  color: "white", piece_type: "Bishop", html_code: "&#9821;")
     Queen.create(game_id: id, starting_position_x: 4, starting_position_y: 8, color: "white", piece_type: "Queen", html_code: "&#9819;")
     King.create(game_id: id, starting_position_x: 5, starting_position_y: 8, color: "white", piece_type: "King", html_code: "&#9818;")
   end
end

	
	
	


