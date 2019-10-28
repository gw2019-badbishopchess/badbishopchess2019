class Chatroom < ApplicationRecord
  has_many :chats
  has_many :users
  belongs_to :game
end
