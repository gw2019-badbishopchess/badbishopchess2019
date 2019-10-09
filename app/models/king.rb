class King < Piece
 def unicode_symbol
		return y_coordinate > 5 ? "&#x2654;"	: "&#9818;"
	end

  def is_valid?(x_destinantion, y_destination)
    if (x_coordinate - x_destinantion).abs <= 1 && (y_coordinate - y_destination).abs <= 1
      return true
    else
      return false
    end 
  end

end