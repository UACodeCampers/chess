class Piece < ApplicationRecord

  belongs_to :game
  has_one :white_player, through: :game
  has_one :black_player, through: :game

  self.inheritance_column = 'piece_type'
  
  attr_reader :captured

  def occupied?(x, y)
    self.game.pieces.where(x_position: x, y_position: y).present?
    game.pieces.where(x_position: x, y_position: y).present?
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
         color: ['color = ?', 'black', 'color = ?', 'white'], 
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

  def move_to!(new_x, new_y)
    if occupied?(new_x, new_y)
      puts "new_x: #{new_x}, #{new_y}"
      piece_at_destination = self.game.pieces.find_by(x_position: new_x, y_position: new_y)
      puts "#{self.color} == #{piece_at_destination.color}"
      fail 'destination occupied by piece of same color' if self.color == piece_at_destination.color
      piece_at_destination.update(x_position: nil, y_position: nil, captured?: true)
    end
    self.update!(x_position: new_x, y_position: new_y)
  end

  def self_check?(new_x, new_y)
    old_x_pos = self.x_position
    old_y_pos = self.y_position
    king = Game.find(self.game_id).pieces.where( 
      game_id: self.game, 
      color: self.color, 
      piece_type: "King"
    )
      self.update(x_position: new_x, y_position: new_y)
      king.find_each do |king|
         if king.check?(king.x_position, king.y_position)
          self.update(x_position: old_x_pos, y_position: old_y_pos)
          return true
        end
      end                     
      self.update(x_position: old_x_pos, y_position: old_y_pos)
    return false
  end 

end