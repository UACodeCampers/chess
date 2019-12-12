require 'byebug'
class King < Piece
    def valid_move?(new_x, new_y)
        distance = 1 # sets diastance for all king moves
        # checks if y_position or x_position is increasing or decreasing by more than 1
        return self.invalid_move(new_x, new_y) if new_x > 8 || new_x < 1
        return self.invalid_move(new_x, new_y) if new_y > 8 || new_y < 1 
        return self.invalid_move(new_x, new_y) if new_x > self.x_position + distance || new_x < self.x_position - distance 
        return self.invalid_move(new_x, new_y) if new_y > self.y_position + distance || new_y < self.y_position - distance 
        # if distance is valid checks if king is obstructed
        return self.invalid_move(new_x, new_y) if self.is_obstructed?(new_x, new_y)
        return true
    end      

    def check?(new_x, new_y)
        opp_pieces = Piece.all.where(
            color: self.color == "white" ? "black" : "white",
            game_id: self.game_id,
            captured?: false,
            )
            opp_pieces.find_each do |piece|  
                return true if piece.valid_move?(new_x, new_y) rescue ArgumentError
            end 
        return false
    end

    def display
        if self.color == "black"
            return "&#x265A;"
        else 
            return "&#x2654;" 
        end
    end

    def can_castle?(new_x, new_y)
      rook = self.game.pieces.where(piece_type:"Rook", color:"#{self.color}", x_position: new_x, y_position: new_y)[0]
      if rook == nil 
        puts "rook not in its position"

      end
      king_x = self.starting_position_x
      rook_x = rook.starting_position_x

      distance = (rook_x - king_x).abs

      !obstruction_query(distance, rook.starting_position_x, rook.starting_position_y)
    end

    def castling(new_x)
        if new_x == 8
            self.update(x_position: 7)
            kingside_rook = self.game.pieces.where(x_position: 8, piece_type: "Rook", color: self.color)
            kingside_rook.update(x_position: 6)
        elsif new_x == 1
            self.update(x_position: 3)
            queenside_rook = self.game.pieces.where(x_position: 1, piece_type: "Rook", color: self.color)
            queenside_rook.update(x_position: 4)
        end
    end

    def castle_to(new_x, new_y)
        if can_castle?(new_x, new_y) 
            castling(new_x)
        else
            puts "Cannot Castle"

        end
    end
end

#next
#if the pieces moved
#if the pieces moved method
#if king or rook in move_to set to true
