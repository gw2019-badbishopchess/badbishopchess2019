class AddChatroomId < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :chatroom_id, :integer
    add_index :chats, :chatroom_id
  end
end
