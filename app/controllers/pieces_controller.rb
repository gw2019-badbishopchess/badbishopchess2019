class PiecesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @piece = Piece.find_by_id(params[:id])
    @game = @piece.game
    @pieces = @game.pieces
    redirect_to game_path(@game)
  end

  def update
    @piece = Piece.find(params[:id])
    @game = @piece.game
    return flash[:danger] = "It is not your turn!" unless @game.game_turn == current_user.id 
    if @piece.move_to!(piece_params)
    else 
      return flash[:danger] = "You have made an illegal move!"
    end
    switch_turns
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
    switch_turns
    redirect_to game_path(@game)
  end

  private

  def castling_x_coord
    @rook.x_coordinate == 1 ? 3 : 7
  end

  def switch_turns
    if @game.white_player_id == @game.game_turn
      @game.update_attributes(game_turn: @game.black_player_id)
    else
      @game.update_attributes(game_turn: @game.white_player_id)
    end
  end

  def piece_params
    params.require(:piece).permit(:id, :x_coordinate, :y_coordinate, :captured, :user_id, :game_id, :white_player_id, :black_player_id, :type)
  end

end
