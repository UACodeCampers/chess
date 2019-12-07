class Pawn < Piece
    def valid_move?(new_x, new_y)   
        return self.invalid_move(new_x, new_y) if new_y > 8 || new_y < 1 
        return self.invalid_move(new_x, new_y) if new_x > 8 || new_x < 1 
        self.x_position == self.starting_position_x && self.y_position == self.starting_position_y ? distance = 2 : distance = 1 
        if self.color == "white"
            return self.invalid_move(new_x, new_y) if new_y > self.y_position + distance || new_y < self.y_position
                if Piece.exists?(
                    x_position: new_x, 
                    y_position: new_y, 
                    game_id: self.game_id, 
                ) 
                    piece = Piece.find_by(x_position: new_x, y_position: new_y, game_id: self.game_id)
                    return self.invalid_move(new_x, new_y) if piece.color == self.color
                    return self.invalid_move(new_x, new_y) if piece.x_position == self.x_position
                    return true if (new_x - self.x_position).abs && (new_y - self.y_position).abs == 1
                end 
            return self.invalid_move(new_x, new_y) if new_x != self.x_position
            return true 
        elsif self.color == "black"
            return self.invalid_move(new_x, new_y) if new_y < self.y_position - distance || new_y > self.y_position
                if Piece.exists?(
                    x_position: new_x, 
                    y_position: new_y, 
                    game_id: self.game_id, 
                ) 
                    piece = Piece.find_by(x_position: new_x, y_position: new_y, game_id: self.game_id)
                    return self.invalid_move(new_x, new_y) if piece.color == self.color
                    return self.invalid_move(new_x, new_y) if piece.x_position == self.x_position
                    return true if (new_x - self.x_position).abs && (new_y - self.y_position).abs == 1
                end 
            return self.invalid_move(new_x, new_y) if new_x != self.x_position
            return true 
        end    
    end

    def display
        if self.color == "black"
            return "&#x265F;"
        else 
            return "&#x2659;" 
        end
    end
end
