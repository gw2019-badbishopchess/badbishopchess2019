class Pawn < Piece

  #line 8 to allow for 2 space move distance for first move
  #line 9 to see if the move is diagonal & not occupied 
  #line 10 to see if the move is 1 space forward if white piece
  #line 11 to see if the move is 1 space forward if black piece
  def is_valid?(x_destination, y_destination)
    x_dist = x_distance(x_destination)
    y_dist = y_distance(y_destination)

    (self.piece_move_count == 0 && x_dist == 0 && y_dist >= 2) || 
    (diagonal_move?(x_destination, y_destination) && occupied?(x_destination, y_destination)) ||
    (self.color_white == false && x_dist == 0 && y_destination == y_dist + 1) ||
    (self.color_white == true && x_dist == 0 && y_destination == y_dist - 1)
  end
end