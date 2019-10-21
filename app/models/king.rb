class King < Piece

  def is_valid?(x_destinantion, y_destination)
    return false if self.in_check?(x_destinantion, y_destination) == false
    return true if (x_coordinate - x_destinantion.to_i).abs <= 1 && (y_coordinate - y_destination.to_i).abs <= 1
    if self.can_castle?(x_destinantion, y_destination) == true
      self.castle(x_destinantion, y_destination)
      return
    end
    return false
  end

  # this method will tell if when moving your own king if they are putting themselves in check - see game model for check by other pieces
  def in_check?(x_cord_dest, y_cord_dest)
    opponenet_pieces = game.pieces.where(color_white: !color_white)
    return false if !opponenet_pieces.nil?
    opponenet_pieces.each do | piece |
      if piece.user_id != self.user_id && !piece.x_coordinate.nil? && piece.is_valid?(x_cord_dest, y_cord_dest)
        return true if piece.is_obstructed?([x_cord_dest, y_cord_dest]) == false && piece.type != "Knight"
      end
    end
    return false
  end

  #these coordinates are for the king's position - either at x-coordinate = 3 or x-coordinate = 7
  def can_castle?(new_x_coord, new_y_coord)
    return false unless self.piece_move_count == 0
    return false unless x_distance(new_x_coord) == 2 && y_distance(new_y_coord) == 0
    if new_x_coord > self.x_coordinate
      castling_rook = game.pieces.where(type: "Rook", user_id: self.user_id, piece_move_count: 0, x_coordinate: 8).first
    else
      castling_rook = game.pieces.where(type: "Rook", user_id: self.user_id, piece_move_count: 0, x_coordinate: 1).first
    end
    return false if castling_rook.nil?
    if !castling_rook.nil?
      return false unless castling_rook.piece_move_count == 0
      puts "in can castle ------------------------------------------- line 37"
      return false if is_obstructed?([castling_rook.x_coordinate, castling_rook.y_coordinate])
      puts "in can castle %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% line 39"
    end
    return true
  end

  def line_obstructed_queenside?(x_coord, y_coord)
    if game.pieces.where(x_coordinate: 2, y_coordinate: self.y_coordinate)
      obstructedpiece = game.pieces.where(x_coordinate: 2, y_coordinate: self.y_coordinate)
      puts obstructedpiece
      puts "there is a piece in the x: 2"
      return true
    elsif game.pieces.where(x_coordinate: 3, y_coordinate: self.y_coordinate)
      puts "there is a piece in the x: 3"
      return true
    elsif game.pieces.where(x_coordinate: 4, y_coordinate: self.y_coordinate)
      puts "there is a piece in the x: 4"
      return true
    else
      return false
    end
  end

  def line_obstructed_kingside?(x_coord, y_coord)
    if game.pieces.where(x_coordinate: 6, y_coordinate: self.y_coordinate)
      puts "there is a piece in the x: 6"
      return true
    elsif game.pieces.where(x_coordinate: 7, y_coordinate: self.y_coordinate)
      puts "there is a piece in the x: 7"
      return true
    else
      return false
    end
  end

  # the update method these coordinates are for the king's position - either at x-coordinate = 3 or x-coordinate = 7
  def castle(new_x_coord, new_y_coord)
    self.update_attributes(x_coordinate: new_x_coord, piece_move_count: 1)
    if new_x_coord == 3
      castling_rook = game.pieces.where(type: "Rook", user_id: self.user.id, x_coordinate: 1).first
      castling_rook.update_attributes(x_coordinate: 4, piece_move_count: 1)
    elsif new_x_coord == 7
      castling_rook = game.pieces.where(type: "Rook", user_id: self.user.id, x_coordinate: 8).first
      castling_rook.update_attributes(x_coordinate: 6, piece_move_count: 1)
    end
  end
end