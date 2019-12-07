class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 attr_writer :login

 has_many :games_as_black, foreign_key: 'black_player_id', class_name: 'Game'
 has_many :games_as_white, foreign_key: 'white_player_id', class_name: 'Game'

  def login
    @login || self.username || self.email
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
          authentication_keys: [:login]

     def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:username) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end
    
    def new_game(name)
      Game.create(white_player_id: self.id, name: name)
    end 
end
