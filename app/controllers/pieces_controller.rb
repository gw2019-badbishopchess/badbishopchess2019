class PiecesController < ApplicationController
  
  def show
    @piece = Piece.find_by_id(params[:id])
    @game = @piece.game
    @pieces = @game.pieces
    flash[:success] = "#{@piece.type} X: #{@piece.x_coordinate} Y: #{@piece.y_coordinate}"
    redirect_to game_path(@game)
  end 

  def update
    @piece = Piece.find(params[:id])
    # if @piece.valid_move?(x_coordinate, y_coordinate)
    #   @piece.move_to!(x_coordinate, y_coordinate)
    @piece.update_attributes(piece_params)
    # else
    #   alert[:error] = "Not Valid Move"
    # end
  end

  def create
    @piece = game.pieces.create(piece_params)
    if @piece.valid?
      redirect_to games_path(@game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def piece_params
    params.require(:piece).permit(:x_coordinate, :y_coordinate, :captured, :user_id, :game_id, :white_player_id, :black_player_id, :type, :game)
  end

end
