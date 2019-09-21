class Game < ApplicationRecord
  has_many :pieces # Creating game to pieces association
  belongs_to :user # Creating game to users association
end
