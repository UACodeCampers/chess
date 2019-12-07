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

    def display
        if self.color == "black"
            return "&#x265A;"
        else 
            return "&#x2654;" 
        end
    end
end
