class Game < ApplicationRecord
  has_many :pieces # Creating game to pieces association
  has_many :users # Creating game to users association
end
