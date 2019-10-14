class PiecesController < ApplicationController
  
  def show
    @piece = Piece.find_by_id(params[:id])
    @game = @piece.game
    @pieces = @game.pieces
    redirect_to game_path(@game)
  end 

  def update
    @piece = Piece.find(params[:id])
    @piece.move_to!(piece_params)
  end

  def create
    @piece = game.pieces.create(piece_params)
    if @piece.valid?
      redirect_to games_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def castling
    @
  end

  private

  def piece_params
    params.require(:piece).permit(:x_coordinate, :y_coordinate, :captured, :user_id, :game_id, :white_player_id, :black_player_id, :type, :game)
  end

end
