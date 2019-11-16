class GamesController < ApplicationController
  helper_method :game

  def index
     @available_game = Game.available.order("created_at DESC")
  end

  def new
    @game = Game.new
  end

  def create
  # @game = Game.create(game_params)
    end
  end

  def show
    @game = Game.where
  end

#private 

#def game
# @game || Game.where(id: params[:id]).last
#end

#def game_params
#  game_params.require(:game).permit(:name, :white_player_id, :black_player_id)
#end
