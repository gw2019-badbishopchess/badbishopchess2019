class Game < ApplicationRecord
  scope :available, -> { where state: "open" }
end
