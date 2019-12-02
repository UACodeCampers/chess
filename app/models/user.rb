class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :games_as_black, foreign_key: 'black_player_id', class_name: 'Game'
  has_many :games_as_white, foreign_key: 'white_player_id', class_name: 'Game'
   
  def new_game(name)
    Game.create(white_player_id: self.id, name: name)
  end 

end
