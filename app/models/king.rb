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
          break
        end
      end
    else  
      return false
    end
  end
          
end