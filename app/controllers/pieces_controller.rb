class PiecesController < ApplicationController
    before_action :authenticate_user!
    def update
        success = true
        message = 'success'
        pieces = []
        
        piece = Piece.find(params[:id])
        
        x = params[:x_position]
        y = params[:y_position]
        begin 
            piece.move_to!(x, y)
            pieces << { id: piece.id, x_position: piece.x_position, y_position: piece.y_position }
        rescue RuntimeError => e
            success = false
            message = e.message
        end
        puts "#{status}"
        render json: {  success: success, 
                        message: message,
                        pieces: pieces }

        # private 
        # def piece_params
        #     params.permit(:game_id, :starting_position_x, :starting_position_y, :color, :piece_type, :html_code)
        # end
    end

end