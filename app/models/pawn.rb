class Pawn < Piece
  def unicode_symbol	
		return y_coordinate > 5 ? "&#9817;" : "&#9823;"
	end
end