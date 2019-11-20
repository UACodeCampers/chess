class Pawn < Piece
    def valid_move?(new_x, new_y)
        # checks if pawn is on starting position returns distance 
        self.x_position == self.starting_position_x && self.y_position == self.starting_position_y ? distance = 2 : distance = 1 
        # checks if y_position is increasing or decreasing by more than 1
        return self.invalid_move(new_x, new_y) if new_y > 8
        return self.invalid_move(new_x, new_y) if new_y > self.y_position + distance || new_y < self.x_position
        # if distance is valid checks if pawn is obstructed
        return self.is_obstructed?(new_x, new_y)
    end
end
