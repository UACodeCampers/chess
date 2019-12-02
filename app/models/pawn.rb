class Pawn < Piece
    def valid_move?(new_x, new_y)   
        return self.invalid_move(new_x, new_y) if new_y > 8 || new_y < 1 
        return self.invalid_move(new_x, new_y) if new_x > 8 || new_y < 1 
        if self.color == "white"
            # checks if pawn is on starting position returns distance 
            self.x_position == self.starting_position_x && self.y_position == self.starting_position_y ? distance = 2 : distance = 1 
        # checks if y_position is increasing or decreasing by more than 1
            return self.invalid_move(new_x, new_y) if new_y > self.y_position + distance || new_y < self.y_position
        # if distance is valid checks if pawn is obstructedS
            return self.is_obstructed?(new_x, new_y)
        elsif self.color == "black"
            self.x_position == self.starting_position_x && self.y_position == self.starting_position_y ? distance = 2 : distance = 1
            return self.invalid_move(new_x, new_y) if new_y < self.y_position - distance || new_y > self.y_position
            return self.is_obstructed?(new_x, new_y)
        end 
    end
end
