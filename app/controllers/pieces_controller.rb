class PiecesController < ApplicationController
  
  

  private

  def piece_params
    params.require(:piece).permit(:x_coordinate, :y_coordinate, :captured, :user_id, :white_player_id, :black_player_id)
  end

end
