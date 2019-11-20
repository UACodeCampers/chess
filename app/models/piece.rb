class Piece < ApplicationRecord
  
  belongs_to :game
  belongs_to :user

  self.inheritance_column = :type

  def move_to!(new_x, new_y)
    if self.color == "black"
      color = "white"
    elsif self.color == "white"
      color = "black"
    end

    if Piece.exists?(
      x_position: new_x,
      y_position: new_y,
      color: color
    )
      return Piece.where(x_position: new_x, y_position: new_y, color: color).update_attribute("captured?" => true)
    end

    return self.update_attributes("x_position" => new_x, "y_position" => new_y)
  end

  def invalid_move(new_x, new_y)
    return "#{self.piece_type} can't move to (#{new_x}, #{new_y})" # replaced later with javascript alert 
  end 

  def is_obstructed?(new_x, new_y) 
    if self.piece_type == "pawn"
    
      return self.vertical_obstruction?(new_x, new_y) 
    
    elsif self.piece_type == "bishop"
    
      return self.diagonal_obstruction?(new_x, new_y) 
    
    elsif self.piece_type == "rook"
      
      return self.horizontal_obstruction?(new_x, new_y) if self.x_position != new_x && self.y_position == new_y 
      return self.vertical_obstruction?(new_x, new_y) if self.y_position != new_y && self.x_position == new_x
      return self.invalid_move(new_x, new_y)
    
    elsif self.piece_type == "queen" || self.piece_type == "king"  
      
      return self.horizontal_obstruction?(new_x, new_y) if self.x_position != new_x && self.y_position == new_y 
      return self.vertical_obstruction?(new_x, new_y) if self.y_position != new_y && self.x_position == new_x 
      return self.diagonal_obstruction?(new_x, new_y) if (new_x - self.x_position).abs == (new_y - self.y_position).abs  
      return self.invalid_move(new_x, new_y)
    
    end
  end 
  
  def obstruction_query(distance, new_x, new_y)
    x_position = self.x_position
    y_position = self.y_position 
    
    distance.times do
      if new_x > x_position 
        x_pos_query = x_position += 1
      elsif new_x < x_position
        x_pos_query = x_position -= 1
      elsif new_x == x_position
        x_pos_query = x_position
      end 
      
      if new_y > y_position 
        y_pos_query = y_position += 1
      elsif new_y < y_position
        y_pos_query = y_position -= 1
      elsif new_y == y_position
        y_pos_query = y_position
      end 

      if Piece.exists?(
        x_position: x_pos_query,
        y_position: y_pos_query,
        color: self.color 
      )
        return true
      end

    end
    return false
  end 

  def horizontal_obstruction?(new_x, new_y)
    return self.invalid_move(new_x, new_y) if new_y != self.y_position # checks to see if the y_position changed and returns invalid if changed
    distance = (new_x - self.x_position).abs # finding distance of new x_position
    return self.obstruction_query(distance, new_x, new_y)
  end

  def vertical_obstruction?(new_x, new_y)
    return self.invalid_move(new_x, new_y) if new_x != self.x_position # checks to see if the x_position changed and returns invalid if changed
    distance = (new_y - self.y_position).abs
    return self.obstruction_query(distance, new_x, new_y)  
  end

  def diagonal_obstruction?(new_x, new_y)
    dist_x_diag = (new_x - self.x_position).abs # new x_position and y_position
    dist_y_diag = (new_y - self.y_position).abs
    distance = (new_x - self.x_position).abs # distance for iteration
    return self.invalid_move(new_x, new_y) if dist_x_diag != dist_y_diag # checks that distance is the same for both x_position and y_position
    # checks for direction of diagonal lines returns obstruction query and iteration
    return self.obstruction_query(distance, new_x, new_y)
  end

end