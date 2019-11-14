class GamesController < ApplicationController
  helper_method :game

  def index
  end

  def new
    @game = Game.new

  end

  def create
    @game = Game.create(game_params)
    redirect_to game_path(@game)
    end
  end

  def show
    @game = Game.where
    unless game.present? return redirect_to root 
  end

private 

def game
  @game || Game.where(id: params[:id]).last
end

def game_params
  game_params.require(:game).permit(:name, :white_player_id, :black_player_id)
end
