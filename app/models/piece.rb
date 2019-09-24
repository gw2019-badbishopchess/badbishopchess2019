class Piece < ApplicationRecord
  has_one :user # Creating pieces to user association
  has_one :game # Creating pieces to game association
end
