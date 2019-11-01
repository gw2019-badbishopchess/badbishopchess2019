class DropChatrooms < ActiveRecord::Migration[5.2]
  def change
    drop_table :chatrooms
  end
end
