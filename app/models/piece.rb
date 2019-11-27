class Piece < ApplicationRecord

  belongs_to :game
  has_one :white_player, through: :game
  has_one :black_player, through: :game

  self.inheritance_column = 'piece_type'
  
  attr_reader :captured

  def occupied?(x, y)
    game.pieces.where(x_position: x, y_position: y).present?
  end

  def move_to!(new_x, new_y)

    # may need to be changed to account for being called in controller
    if Piece.exists?(
      x_position: new_x,
      y_position: new_y,
      color: ['color = ?', 'black', 'color = ?', 'white']
    )
      # may need to be changed to account for being called in controller
      piece = Piece.find_by(x_position: new_x, y_position: new_y)
      return self.invalid_move(new_x, new_y) if piece.color == self.color
      piece.update("captured?" => true)
     
    end
  # may need to be changed to account for being called in controller  
  return self.update("x_position" => new_x, "y_position" => new_y)
  end

  def invalid_move(new_x, new_y)
    return "#{self.piece_type} can't move to (#{new_x}, #{new_y})" # replaced later with javascript alert 
  end 

  def is_obstructed?(new_x, new_y) 
    if self.piece_type == "Pawn"
    
      return self.vertical_obstruction?(new_x, new_y) 
    
    elsif self.piece_type == "Bishop"
    
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
        color: ['color = ?', 'black', 'color = ?', 'white']
      )

        piece = Piece.find_by(x_position: x_pos_query, y_position: y_pos_query)
        return false if piece.x_position == new_x && piece.y_position == new_y
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

   def move_to!(new_x, new_y)
    @game = game
    if occupied?(new_x, new_y)
      @piece_at_destination = @game.pieces.find_by(x_position: new_x, y_position: new_y)
      if color == @piece_at_destination.color
        fail 'destination occupied by piece of same color'
      else
        @piece_at_destination.update_attributes(x_position: nil, y_position: nil, status: 'captured')
        @status = @piece_at_destination.status
        @captured = true
      end
    else @captured = false
    end
  end

end