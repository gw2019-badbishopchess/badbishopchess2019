class Pawn < Piece

  #line 8 to allow for 2 space move distance for first move
  #line 10 to see if the move is diagonal & not occupied 
  #line 12 to see if the move is 1 space forward if white piece
  #line 14 to see if the move is 1 space forward if black piece
  def is_valid?(new_x_coord, new_y_coord)
    x_dist = x_distance(new_x_coord)
    y_dist = y_distance(new_y_coord)

    if piece_move_count == 0 && x_dist == 0 && y_dist <= 2
      return true
    elsif diagonal_move?(new_x_coord, new_y_coord) && occupied?(new_x_coord, new_y_coord)
      return true
    elsif color_white == true && x_dist == 0 && y_dist == 1 && !occupied?(new_x_coord, new_y_coord) && new_y_coord.to_i >= self.y_coordinate
      return true
    elsif color_white == false && x_dist == 0 && y_dist == 1 && !occupied?(new_x_coord, new_y_coord) && new_y_coord.to_i <= self.y_coordinate
      return true
    elsif x_dist == 0 && y_dist == 0
      return false
    elsif pawn_promotion?
      self.update_attributes(type: "Queen")
      return true
    else 
      return false
    end
  end

# Existing Errors in pawn_promotion
# Taking opponent piece right after promotion doesn't change piece image
# Piece image doesn't change until after move
  def pawn_promotion?
    pawn = game.pieces.where(type: "Pawn")
    if self.type == "Pawn" && ((self.y_coordinate == 8 && self.color_white == true) || (self.y_coordinate == 1 && self.color_white == false))
      self.update_attributes(type: "Queen")
    end
  end

end