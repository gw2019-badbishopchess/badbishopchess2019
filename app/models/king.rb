class King < Piece

  def is_valid?(x_destinantion, y_destination)
    if (x_coordinate - x_destinantion).abs <= 1 && (y_coordinate - y_destination).abs <= 1
      return true
    else
      return false
    end 
  end

  # this method will tell if when moving your own king if they are putting themselves in check - see game model for check by other pieces
  def check(x_coordinate, y_coordinate)
    opponenet_pieces = game.pieces.where(color_white: !color_white)
    opponenet_pieces.each do | piece |
      if piece.user_id != self.user_id && piece.x_coordinate != nil && piece.y_coordinate != nil
        if piece.is_valid?(x_coordinate, y_coordinate) == true && piece.is_obstructed?([x_coordinate, y_coordinate]) == false
          return true
        end
        return false
      end
    end
  end

end