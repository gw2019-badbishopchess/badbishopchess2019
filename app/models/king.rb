class King < Piece

  def is_valid?(x_destinantion, y_destination)
    if (x_coordinate - x_destinantion).abs <= 1 && (y_coordinate - y_destination).abs <= 1
      return true
    else
      return false
    end 
  end

  def in_check?
    game.pieces.each do | piece |
      if piece.user_id != self.user_id && piece.x_coordinate != nil
        if piece.is_valid?(x_coordinate, y_coordinate) == true && piece.is_obstructed?([x_coordinate, y_coordinate])
      end
    end
  end

end