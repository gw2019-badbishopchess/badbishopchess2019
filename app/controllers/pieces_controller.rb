class PiecesController < ApplicationController


  def show  
    @piece = Piece.find(params[:id])
    @game = Game.find(params[:id])  
  end

end 
