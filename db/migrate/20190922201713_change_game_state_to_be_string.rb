class ChangeGameStateToBeString < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :state, :string, :default => 'open'
  end
end
