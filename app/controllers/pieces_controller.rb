class PiecesController < ApplicationController

def create
    @piece = game.pieces.create(piece_params)
    
      redirect_to games_path(@game)
  end
def show
    @piece = Piece.find(params[:id])
    @game = @piece.game
    @pieces = @game.pieces
end
private
	def piece_params
    params.permit(
      :game_id, :x_position, :y_position, :starting_position_x, :starting_position_y, :color, :piece_type, :html_code, :captured?)

  end
end

 