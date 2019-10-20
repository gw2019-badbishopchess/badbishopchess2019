class Rook < Piece
<<<<<<< HEAD
  def valid_move?(x_destination, y_destination)
    if (x_coordinates == x_destination || y_coordinates == y_destination) && !is_obstructed?([x_destination, y_destination])
        return true
    else return false
    end
  end

=======
  def is_valid?(new_x_coord, new_y_coord)
    x_distance = x_distance(new_x_coord)
    y_distance = y_distance(new_y_coord)

    return false if is_obstructed?([new_x_coord, new_y_coord])
    (x_distance >= 1 && y_distance == 0) || (x_distance == 0 && y_distance >= 1 ) 
  end
>>>>>>> 8798c0ef58681d4603a41e0a6be835592527552f
end