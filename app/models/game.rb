class Game < ApplicationRecord
  scope :available, -> { where state: "open" }  #to help find which games are available
end
