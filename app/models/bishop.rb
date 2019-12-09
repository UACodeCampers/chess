class Bishop < Piece
    def valid_move?(new_x, new_y)
        # checks if new_x or new_y is above 8 or less than 1
        dist_x_diag = (new_x - self.x_position).abs # new x_position and y_position
        dist_y_diag = (new_y - self.y_position).abs
        return self.invalid_move(new_x, new_y) if dist_x_diag != dist_y_diag
        return self.invalid_move(new_x, new_y) if new_x > 8 || new_x < 1
        return self.invalid_move(new_x, new_y) if new_y > 8 || new_y < 1 
        return self.invalid_move(new_x, new_y) if self.is_obstructed?(new_x, new_y)
        return self.invalid_move(new_x, new_y) if self.self_check?(new_x, new_y)
        return true
    end

    def display
      if self.color == "black"
        return "&#x265D;"
      else 
        return "&#x2657;" 
      end
    end
end
