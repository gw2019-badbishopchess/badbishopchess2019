class Knight < Piece
  def unicode_symbol
		return y_coordinate > 5 ? "&#9816;" : "&#9822;"	
	end
  def valid_move?(x_destination, y_destination) 
    x_distance = x_distance(x_destination)
    y_distance = y_distance(y_destination)

    (x_distance == 1 && y_distance == 2) || (x_distance == 2 && y_distance == 1)
  end
  
end