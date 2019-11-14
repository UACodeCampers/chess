class Piece < ApplicationRecord
  belongs_to :user
  belongs_to :game

  self.inheritance_column = :piece_type
end
