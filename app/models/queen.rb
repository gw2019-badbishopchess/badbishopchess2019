class Queen < Piece
  def unicode_symbol	
		return y_coordinate > 5 ? "&#9813;" : "&#9819;"
	end
end