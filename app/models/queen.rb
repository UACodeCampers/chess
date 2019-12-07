class Queen < Piece
    def valid_move?(new_x, new_y)
        return self.invalid_move(new_x, new_y) if new_x > 8 || new_x < 1
        return self.invalid_move(new_x, new_y) if new_y > 8 || new_y < 1 
        return self.invalid_move(new_x, new_y) if self.is_obstructed?(new_x, new_y)
        return true 
    end 
    
    def display
      if self.color == "black"
        return "&#x265B;"
      else 
        return "&#x2655;" 
      end
    end
end
