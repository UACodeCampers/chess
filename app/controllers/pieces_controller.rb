class PiecesController < ApplicationController
    before_action :authenticate_user!
    def update
        @piece = Piece.find(params[:id])
        x = params[:x_position]
        y = params[:y_position]
        begin 
            @piece.move_to!(x, y)
        rescue RuntimeError => e
            render json: {success: false, message: e.message}
            return
        end
        render json: {success: true}
        @piece.update_attributes(:x_position => x, :y_position => y)
        redirect_to game_path
    end

end