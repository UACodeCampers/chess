class PiecesController < ApplicationController

 def update
    @piece = Piece.find(params[:id])
    @game = @piece.game

    

      @piece.update(piece_params)
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @piece, status: :ok}
      end
    
    end

    private 
    def piece_params
    params.permit(:game_id, :starting_position_x, :starting_position_y, :color, :piece_type, :html_code)
  end
    
    
  end

 