class Bishop < Piece
  
  def is_valid?(x_destination, y_destination)
    return false if is_obstructed?([x_destination, y_destination])
    x_distance = x_distance(x_destination)
    y_distance = y_distance(y_destination)
    (x_distance >= 1 && y_distance >=1) && diagonal_move?(x_destination, y_destination)
  end
end