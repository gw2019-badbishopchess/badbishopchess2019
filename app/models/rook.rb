class Rook < Piece
  def unicode_symbol	
		return y_coordinate > 5 ? "&#9814;" : "&#9820;"
	end
end