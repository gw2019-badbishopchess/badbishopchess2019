class Knight < Piece
  
  def valid_move?(x_destination, y_destination) 
    x_distance = x_distance(x_destination)
    y_distance = y_distance(y_destination)

    (x_distance == 1 && y_distance == 2) || (x_distance == 2 & y_distance == 1)
  end
  
end