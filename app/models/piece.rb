class Piece < ApplicationRecord

  belongs_to :game
  # belongs_to :user

  self.inheritance_column = 'piece_type'

  def move_to!(new_x, new_y)

    if Piece.exists?(
      x_position: new_x,
      y_position: new_y,
      game_id: self.game_id,
      color: ['color = ?', 'black', 'color = ?', 'white']
    )
     
      piece = Piece.find_by(x_position: new_x, y_position: new_y, game_id: self.id)
      return self.invalid_move(new_x, new_y) if piece.color == self.color
      piece.update("captured?" => true)
     
    end

  return self.update("x_position" => new_x, "y_position" => new_y)
  end

  def invalid_move(new_x, new_y)
   raise ArgumentError.new("#{self.piece_type} can't move to (#{new_x}, #{new_y})")
  end 

  def is_obstructed?(new_x, new_y) 
    if self.piece_type == "Bishop"
    
      return self.diagonal_obstruction?(new_x, new_y)
    
    elsif self.piece_type == "Rook"
      
      return self.horizontal_obstruction?(new_x, new_y) if self.x_position != new_x && self.y_position == new_y 
      return self.vertical_obstruction?(new_x, new_y) if self.y_position != new_y && self.x_position == new_x
      return self.invalid_move(new_x, new_y)
    
    elsif self.piece_type == "Queen" || self.piece_type == "King"  
      
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
        game_id: self.game_id,
        color: ['color = ?', 'black', 'color = ?', 'white']
      )

        piece = Piece.find_by(x_position: x_pos_query, y_position: y_pos_query, game_id: self.game_id)
        return false if piece.x_position == new_x && piece.y_position == new_y
        return true
      end

    end
    return false
  end 

  def horizontal_obstruction?(new_x, new_y)
    distance = (new_x - self.x_position).abs 
    return self.obstruction_query(distance, new_x, new_y)
  end

  def vertical_obstruction?(new_x, new_y)
    distance = (new_y - self.y_position).abs
    return self.obstruction_query(distance, new_x, new_y)  
  end

  def diagonal_obstruction?(new_x, new_y)
    distance = (new_x - self.x_position).abs 
    return self.obstruction_query(distance, new_x, new_y)
  end

end