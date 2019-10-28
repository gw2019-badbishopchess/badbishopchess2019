class AddGameIdtoChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :game_id, :integer
  end
end
