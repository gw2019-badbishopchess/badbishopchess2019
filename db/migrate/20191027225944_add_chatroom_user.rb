class AddChatroomUser < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :creator_id, :integer
    add_index :chatrooms, :creator_id
  end
end
