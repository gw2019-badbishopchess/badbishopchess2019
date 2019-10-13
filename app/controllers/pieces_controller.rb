class PiecesController < ApplicationController
<<<<<<< HEAD


  def show  
    @piece = Piece.find(params[:id])
    @game = Game.find(params[:id])  
  end

end 
=======
  
  

  private

  def piece_params
    params.require(:piece).permit(:x_coordinate, :y_coordinate, :captured, :user_id, :white_player_id, :black_player_id)
  end

end
>>>>>>> 378fe3a14c761636dec547e67f37256c3cf65f8c
