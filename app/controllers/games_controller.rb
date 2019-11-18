class GamesController < ApplicationController
  helper_method :game
  before_action :authenticate_user!

  def index
    @available_games = Game.available.order("created_at DESC")

  end

  def new
    @game = Game.new
  end

  def update
    @game = Game.find(params[:id])
    @game.black_player_id = current_user.id
    @game.save
    redirect_to game_path(@game)
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
