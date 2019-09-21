class AddColumnIdToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :id, :primary_key
  end
end
