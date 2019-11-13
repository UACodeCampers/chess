class Game < ApplicationRecord
    def self.available 
        where(black_player_id: nil).or(where(white_player_id: nil))
    end 
end
