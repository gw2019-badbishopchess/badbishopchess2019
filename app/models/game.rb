class Game < ApplicationRecord
  has_many :pieces # Creating game to pieces association
  belongs_to :user # Creating game to users association

  scope :available, -> { where state: "open" } #to help find which games are available
end
