class Queen < Piece
    def valid_move?(new_x, new_y)
        # checks if new_x or new_y is above 8 or less than 1
        return self.invalid_move(new_x, new_y) if new_x > 8 || new_x < 1
        return self.invalid_move(new_x, new_y) if new_y > 8 || new_y < 1 
        return self.is_obstructed?(new_x, new_y)
    end
end
