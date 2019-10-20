class Knight < Piece
  
  def is_valid?(x_destination, y_destination) 
    x_dist = x_distance(x_destination)
    y_dist = y_distance(y_destination)

    (x_dist == 1 && y_dist == 2) || (x_dist == 2 && y_dist == 1)
  end
  
end