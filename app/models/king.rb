class King < Piece

  def is_valid?(x_destinantion, y_destination)
    if (x_coordinate - x_destinantion.to_i).abs <= 1 && (y_coordinate - y_destination.to_i).abs <= 1
      puts "it's valid"
      return true
    else
      puts "it's not a valid move"
      return false
    end 
  end

  # this method will tell if when moving your own king if they are putting themselves in check - see game model for check by other pieces
  def in_check?(x_cord_dest, y_cord_dest)
    opponenet_pieces = game.pieces.where(color_white: !color_white)
    opponenet_pieces.each do | piece |
      if piece.user_id != self.user_id && piece.x_coordinate != nil && piece.y_coordinate != nil
        if self.is_valid?(x_cord_dest, y_cord_dest) == true && self.is_obstructed?([x_cord_dest, y_cord_dest]) == false
          return true
        end
        return false
      end
    end
  end

end