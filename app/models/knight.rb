class Knight < Piece
    def valid_move?(new_x, new_y)
        return self.invalid_move(new_x, new_y) if new_x > 8 || new_y > 8 
        return self.invalid_move(new_x, new_y) if new_y < 1 || new_y < 1 
        
        if (new_x - self.x_position).abs == 2
            return self.invalid_move(new_x, new_y) if (new_y - self.y_position).abs > 1
            return true
        elsif (new_y - self.y_position).abs == 2
            return self.invalid_move(new_x, new_y) if (new_x - self.x_position).abs > 1
            return true
        else 
            return self.invalid_move(new_x, new_y)
        end 
    end

    def display
        if self.color == "black"
            return "&#x265E;"
        else 
            return "&#x2658;" 
        end
    end
end
