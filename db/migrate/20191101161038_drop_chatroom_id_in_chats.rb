class DropChatroomIdInChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :chatroom_id
  end
end
