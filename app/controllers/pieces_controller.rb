class PiecesController < ApplicationController
  
  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
   
    
      @piece.update(piece_params)
      respond_to do |format|
        format.html {render :show }
        format.json { render json: @piece, status: :ok }
      end


   # if !your_turn?
    #  render text: 'It must be your turn',
    #  status: :unauthorized
    

  end

  private

  def piece_params
    params.permit(:id, :x_coordinate, :y_coordinate, :captured, :user_id, :white_player_id, :black_player_id)
  end

end
