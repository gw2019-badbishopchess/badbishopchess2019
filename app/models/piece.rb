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
    puts "x1: #{x1.is_a? Integer}"
    puts "x2: #{x2.is_a? Integer}"
    puts "x2: #{x2.is_a? Integer}"
    puts "y2: #{y2.is_a? Integer}"
    if y1 == y2 
      puts 'horizontal'
      return 'horizontal'
    elsif x1 == x2
      puts 'vertical'
      return 'vertical'
    else
      puts "$$$$$$$$$$$$$$$$$$$#{(y2 - y1).to_f}"
      @slope = (y2 - y1).to_f / (x2 - x1).to_f
      puts @slope
    end
  end

  #The is_obstructed? method determines whether piece's path is obstructed
  # args = array containing x and y coordinates of intended destination
  # returns True if one or more spaces are occupied, otherwise False
  # runtime error if not straight line
  def is_obstructed?(destination)
    puts "in is_obstructed"
    @game = game
    
    x1 = self.x_coordinate.to_i
    y1 = self.y_coordinate.to_i
    x2 = destination[0].to_i
    y2 = destination[1].to_i

    path = check_path(x1, y1, x2, y2)
    puts path
    # checks rightward horizontal if occupied
    if path == 'horizontal' && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        return true if occupied?(x, y1)
      end
    end
    puts "past rightward horizontal"
    # checks leftward horizontal if occupied
    if path == 'horizontal' && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        return true if occupied?(x, y1)
      end
    end
    puts "past leftward horizontal"
    # checks upward vertical if occupied
    if path == 'vertical' && y1 < y2 
      (y1 + 1).upto(y2 - 1) do |y|
        return true if occupied?(x1, y)
      end
    end
    puts "past up vertical"
    # checks if downard vertical is occupied
    if path == 'vertical' && y1 > y2
      (y1 - 1).downto(y2 + 1) do |y|
        return true if occupied?(x1, y)
      end
    end
    puts "past down vertical"
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

    puts 'end of is obstructed method'
  end

  # checks if (x_end, y_end) are shared with other piece's coordinates
  
  def contains_own_piece?(x_end, y_end)
    if piece = game.pieces.find_by(x_coordinate: x_end, y_coordinate: y_end)
      if piece.color_white == true && self.user_id == game.white_player_id || piece.color_white == false && self.user_id == game.black_player_id
        puts "Error: Obstructed by Own Piece!"
        return 
      else
        remove_piece(piece)
        return false
      end
      return false
    end
  end

  def remove_piece(dead)
    dead.update_attributes(x_coordinate: nil, y_coordinate: nil, piece_captured: true)
  end

  def move_to!(piece_params)
    if self.is_valid?(piece_params[:x_coordinate], piece_params[:y_coordinate]) &&
    self.contains_own_piece?(piece_params[:x_coordinate], piece_params[:y_coordinate]) &&
    (self.type == "King" && !self.in_check?(piece_params[:x_coordinate], piece_params[:y_coordinate]))
    return self.update_attributes(x_coordinate: piece_params[:x_coordinate], y_coordinate: piece_params[:y_coordinate])
    else 
      return false
    end
  end

    #this will see if the move from the piece is diagonal? will return true if it diagonal
  def diagonal_move?(x, y)
    return true if (x_coordinate - x.to_i).abs == (y_coordinate - y.to_i).abs && (x_coordinate != x.to_i)
  end

  #this figures out the distane of the x axis
  def x_distance(new_x_coord)
    (new_x_coord.to_i - x_coordinate).abs
  end

  #this figures out the distane of the y axis
  def y_distance(new_y_coord)
    (new_y_coord.to_i - y_coordinate).abs
  end

  def image
    color_white == true ? "White#{self.type}.png" : image = "Black#{self.type}.png"
  end

end
