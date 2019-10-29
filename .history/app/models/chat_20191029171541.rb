class Chat < ApplicationRecord
  has_one :user
  belongs_to :game
  after_create :notify_pusher

  def notify_pusher
    Pusher.trigger('chat', 'new', self.as_json)
  end
end
