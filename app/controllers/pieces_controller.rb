class PiecesController < ApplicationController
  def move_to!(new_x, new_Y)
    # Is_Obstructed? Method

    # Is_opponent_piece_present? Method

    # Is_piece_present? Method

    # Update_attributes Method
    @piece.update_attributes(:x_coord, :y_coord)
  end

  def 

  private

  def piece_params
    params.require(:game).permit(:name, :user_id, :white_player_id, :black_player_id)
  end
end
