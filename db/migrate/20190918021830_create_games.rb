class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :game_id
      t.integer :game_turn
      t.integer :user_turn
      t.integer :white_player_id
      t.integer :black_player_id
      t.integer :winning_user_id
      t.integer :state
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.timestamps
    end

    add_index :games, :id
    add_index :games, :white_player_id
    add_index :games, :black_player_id
  end
end
