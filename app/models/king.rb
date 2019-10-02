class King < Piece


  def is_valid?(x_destinantion, y_destination)
    if (x_coordinate - x_destinantion).abs <= 1 && (y_coordinate - y_destination).abs <= 1
      return true
    else
      return false
    end 
  end

end