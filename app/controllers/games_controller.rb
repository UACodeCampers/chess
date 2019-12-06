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

  # def invalid_move(new_x, new_y)
  #   render :json => {message:"#{self.piece_type} can't move to (#{new_x}, #{new_y})"}, :status => :internal_server_error 
  # end 

#def game
# @game || Game.where(id: params[:id]).last
#end

#def game_params
#  game_params.require(:game).permit(:name, :white_player_id, :black_player_id)
#end