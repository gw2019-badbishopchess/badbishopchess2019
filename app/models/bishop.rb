class Bishop < Piece
  
  def is_valid?(x_destination, y_destination)
    puts "!!!!!!!!!!!!!!!!!!!!biship in in valid method"
    piecepath = [x_destination, y_destination]
    puts piecepath
    if is_obstructed?(piecepath) == false
      
      x_distance = x_distance(x_destination)
      y_distance = y_distance(y_destination)
      
      (x_distance >= 1 && y_distance >=1) && diagonal_move?(x_destination, y_destination)
    else
      render plain: "Path is obstructed."
    end
  end
end