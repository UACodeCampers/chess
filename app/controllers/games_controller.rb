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

  
  @game = current_user.games.create(white_player_id: current_user.id, name: game_params["name"])
  @game.save
  @game.populate_game!

  redirect_to game_path(@game)
    end
  


  def show
    @game = Game.find(params[:id])
    @pieces = @game.pieces

  end

private 

  def game
    @game || Game.where(id: params[:id]).last
  end


def game_params
  params.require(:game).permit(:name)
end

end
