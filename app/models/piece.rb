class Piece < ApplicationRecord
  has_one :user # Creating pieces to user association
  belongs_to :game # Creating pieces to game association

  
  # The occupied? method checks whether there is a piece a at (x, y)
  # args = x coordinate and y coordinate of space
  # returns true if occupied, false if unoccupied 
  def occupied?(x, y)
    game.pieces.where(x_coordinate: x, y_coordinate: y).present?
  end

  
  # The check_path method checks the piece's path to destination
  # args = piece coordinates and destination coordinates
  # returns 'horizontal', 'vertical' or if slope, returns degree of slope
  def check_path(x1, y1, x2, y2)
    if y1 == y2 
      return 'horizontal'
    elsif x1 == x2
      return 'vertical'
    else
      @slope = (y2 - y1).to_f / (x2 - x1).to_f
    end
  end

  #The is_obstructed? method determines whether piece's path is obstructed
  # args = array containing x and y coordinates of intended destination
  # returns True if one or more spaces are occupied, otherwise False
  # runtime error if not straight line
  def is_obstructed?(destination)
    @game = game

    x1 = self.x_coordinate
    y1 = self.y_coordinate
    x2 = destination[0]
    y2 = destination[1]


    path = check_path(x1, y1, x2, y2)

    # checks rightward horizontal if occupied
    if path == 'horizontal' && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        return true if occupied?(x, y1)
      end
    end

    # checks leftward horizontal if occupied
    if path == 'horizontal' && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        return true if occupied?(x, y1)
      end
    end

    # checks upward vertical if occupied
    if path == 'vertical' && y1 < y2 
      (y1 + 1).upto(y2 - 1) do |y|
        return true if occupied?(x1, y)
      end
    end

    # checks if downard vertical is occupied
    if path == 'vertical' && y1 > y2
      (y1 - 1).downto(y2 + 1) do |y|
        return true if occupied?(x1, y)
      end
    end

    # returns false if none of above is true
    if path == 'horizontal' || path == 'vertical'
      return false
    end

    # checks if rightward slope is occupied
    if @slope.abs == 1.0 && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        delta_y = x - x1
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x, y)
      end
    end

    # checks if leftward slope is occupied
    if @slope.abs == 1.0 && x1 > x2
      x1 - 1.downto(x2 +1) do |x|
        delta_y = x1 - x 
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x, y)
      end
    end

    # throws runtime error if not straight line 
    # returns false if straight slope is unoccupied
    if @slope.abs != 1.0
      fail 'path is not a straight line'
    else return false
    end
  end
end
