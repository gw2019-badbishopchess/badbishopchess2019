class ChangeColumn < ActiveRecord::Migration[5.2]
  def change
    change_column :pieces, :piece_move_count, :integer, :default => 0
  end
end
