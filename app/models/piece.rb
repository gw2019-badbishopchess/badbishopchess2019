class Piece < ApplicationRecord
  has_one :user # Creating pieces to user association
  belongs_to :game # Creating pieces to game association

  def occupied?(x, y)
    game.pieces.where(x_coordinate, y_coordinate).present?
  end

  def check_path(x1, y1, x2, y2)
    if y1 == y2 
      return 'horizontal'
    elsif x1 == x2
      return 'vertical'
    else
      @slope = (y2 - y1).to_f / (x2 - x1).to_f
    end
  end



  def obstructed?(destination)
    @game = game

    x1 = self.x_coordinate
    y1 = self.y_coordinate
    x2 = destination[0]
    y2 = destination[1]


    path = check_path(x1, y1, x2, y2)

    if path == 'horizontal' && x1 < x2
      (x1 + 1).upto(x2 - 1) do |x|
        return true if occupied?(x, y1)
      end
    end

    if path == 'horizontal' && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        return true if occupied?(x, y1)
      end
    end

    if path == 'vertical' && y1 < y2 
      (y1 + 1).upto(y2 - 1) do |y|
        return true if occupied?(x1, y)
      end
    end

    if path == 'vertical' && y1 > y2
      (y1 - 1).downto(y2 + 1) do |y|
        return true if occupied?(x1, y)
      end
    end

    if path == 'horizontal' || path == 'vertical'
      return false
    end

    if @slope.abs == 1.0 && x1 > x2
      (x1 - 1).downto(x2 + 1) do |x|
        delta_y = x1 - x
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x, y)
      end
    end
  end




end
