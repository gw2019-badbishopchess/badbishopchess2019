class King < Piece

  def is_valid?(x_destinantion, y_destination)
    if self.in_check?(x_destinantion, y_destination)
      return false
    elsif (x_coordinate - x_destinantion.to_i).abs <= 1 && (y_coordinate - y_destination.to_i).abs <= 1
      return true
    else 
      return false
    end 
  end

  # this method will tell if when moving your own king if they are putting themselves in check - see game model for check by other pieces
  def in_check?(x_cord_dest, y_cord_dest)
    opponenet_pieces = game.pieces.where(color_white: !color_white)
    if opponenet_pieces != nil
      opponenet_pieces.each do | piece |
        if piece.user_id != self.user_id && piece.x_coordinate != nil && piece.is_valid?(x_cord_dest, y_cord_dest)
          return true
        end
      end
    else  
      return false
    end
  end

  def can_castle?(new_x_coord, new_y_coord)
    return false unless self.piece_move_count == 0
    return false unless x_distance(new_x_coord) == 2 && y_distance(new_x_coord) == 0
    if new_x_coord > x_coordinate
      castling_rook = self.game.pieces.where(type: "Rook", user_id: self.user.id, x_coordinate: 8).first
    else
      castling_rook = self.game.pieces.where(type: "Rook", user_id: self.user.id, x_coordinate: 1).first
    end
    return false if castling_rook.nil?
    if castling_rook.nil? || castling_rook.piece_move_count > 0 || is_obstructed?([castling_rook.x_coordinate, castling_rook.y_coordinate])
      return false
    end
    return true
  end

  def castle(new_x_coord, new_y_coord)
    if can_castle?(new_x_coord, new_y_coord)
      @king.update_attributes(x_coordinate: new_x_coord, y_coordinate: new_y_coord, piece_move_count: 1)
      if new_x_coord == 3
        @rook_for_castling.update_attributes(x_coordinate: 4, piece_move_count: 1)
      else new_x_coord == 7
        @rook_for_castling.update_attributes(x_coordinate: 6, piece_move_count: 1)
      end
    end
  end
  end
          
end