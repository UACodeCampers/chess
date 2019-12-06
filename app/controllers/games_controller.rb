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
    @game = Game.find_by_id(params[:id])
    @pieces = @game.pieces
  end

private 

  def game
    @game || Game.find_by_id(params[:id])
  end


  def game_params
  params.require(:game).permit(:name, :white_player_id, :black_player_id)
  end

end