class PiecesController < ApplicationController
    before_action :authenticate_user!
    def update
        piece = Piece.find(params[:id]).transmogrify
        x = params[:x_position]
        y = params[:y_position]
        begin 
            piece.move_to!(x, y)
        rescue RuntimeError => e
            render json: {success: false, message: e.message}
            return
        end
        render json: {success: true}
    end
end