class Queen < Piece

  def diagonal_move?(x, y)
    return true if (x_coordinate - x).abs == (y_coordinate - y).abs && (x_coordinate != x)
  end

  def x_distance(new_x_coord)
    x_distance = (new_x_coord - x_coordinate).abs
  end

  def y_distance(new_y_coord)
    y_distance = (new_y_coord - y_coordinate).abs
  end



  def (new_x_coord, new_y_coord)
    x_distance = x_distance(new_x_coord)
    y_distance = y_distance(new_y_coord)

    return true if ((x_distance >= 1 && y_distance == 0) || (y_distance >= 1 && x_distance == 0) || ((x_distance >= 1 && y_distance >= 1) && diagonal?(x_distance, y_distance)))
  end
end