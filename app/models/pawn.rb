class Pawn < Piece

  #line 8 to allow for 2 space move distance for first move
  #line 10 to see if the move is diagonal & not occupied 
  #line 12 to see if the move is 1 space forward if white piece
  #line 14 to see if the move is 1 space forward if black piece
  def is_valid?(new_x_coord, new_y_coord)
    new_x_coord = new_x_coord.to_i
    new_y_coord = new_y_coord.to_i
    return true if piece_move_count == 0 && x_distance(new_x_coord) == 0 && y_distance(new_y_coord) <= 2
    return true if diagonal_move?(new_x_coord, new_y_coord) && occupied?(new_x_coord, new_y_coord) && x_distance(new_x_coord).abs <= 1 && y_distance(new_y_coord).abs <= 1
    return true if color_white == true && x_distance(new_x_coord) == 0 && new_y_coord == (self.y_coordinate + 1).to_i
    return true if color_white == false && x_distance(new_x_coord) == 0 && new_y_coord == (self.y_coordinate - 1).to_i
    return false
  end
end