class Pawn < Piece

  #line 8 to allow for 2 space move distance for first move
  #line 9 to see if the move is diagonal & not occupied 
  #line 10 to see if the move is 1 space forward if white piece
  #line 11 to see if the move is 1 space forward if black piece
  def is_valid?(new_x_coord, new_y_coord)
    (self.piece_move_count == 0 && x_distance == 0 && y_distance >= 2) || 
    (diagonal_move?(new_x_coord, new_y_coord) && !occupied?(new_x _coord, new_y_coord)) ||
    (self.color_white == true && x_distance == 0 && new_y_coord == y_coordinate + 1) ||
    (self.color_white == false && x_distance == 0 && new_y_coord == y_coordinate - 1)
  end
end