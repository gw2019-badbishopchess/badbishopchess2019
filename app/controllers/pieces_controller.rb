class PiecesController < ApplicationController
<<<<<<< HEAD
<<<<<<< HEAD


  def show  
    @piece = Piece.find(params[:id])
    @game = Game.find(params[:id])  
  end

end 
=======
=======
  before_action :authenticate_user!
>>>>>>> 8798c0ef58681d4603a41e0a6be835592527552f
  
  def show
    @piece = Piece.find_by_id(params[:id])
    @game = @piece.game
    @pieces = @game.pieces
    redirect_to game_path(@game)
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    if @piece.move_to!(piece_params)
    else 
      flash[:danger] = "You have made an illegel move!"
    end
    flash[:danger] = "The King is in Check!" if @piece.check_to_king? 
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
    @rook = Piece.find(params[:id])
    @game = @rook.game
    @king = @game.pieces.where(type: 'King', user_id: current_user.id).first
    if @king.can_castle?(castling_x_coord, @king.y_coordinate)
      @king.castle(castling_x_coord, @king.y_coordinate)
    else flash[:danger] = 'You cannot castle.'
    end
    redirect_to game_path(@game)
  end

  private

  def castling_x_coord
    @rook.x_coordinate == 1 ? 3 : 7
  end

  def piece_params
    params.require(:piece).permit(:id, :x_coordinate, :y_coordinate, :captured, :user_id, :game_id, :white_player_id, :black_player_id, :type)
  end
end
>>>>>>> 378fe3a14c761636dec547e67f37256c3cf65f8c
