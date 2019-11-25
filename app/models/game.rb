class Game < ApplicationRecord
	has_many :pieces
	belongs_to :user
	scope :available, -> { where(black_player_id: nil) }
	
	
end
