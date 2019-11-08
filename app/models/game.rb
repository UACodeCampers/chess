class Game < ApplicationRecord
    def self.avliable 
        where(black_player_id: nil)
    end 
end
