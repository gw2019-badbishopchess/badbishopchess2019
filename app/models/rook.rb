class Rook < Piece
  def valid_move?(x_destination, y_destination)
    if (x_coordinates == x_destination || y_coordinates == y_destination) && !is_obstructed?([x_destination, y_destination])
        return true
    else return false
    end
  end

end