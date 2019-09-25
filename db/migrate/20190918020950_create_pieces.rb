class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :piece do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :x_coordinate
      t.integer :y_coordinate
      t.integer :piece_move_count
      t.string :piece_type
      t.boolean :color_white
      t.boolean :piece_captured, default: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :game
      t.references :user
    end
    
  end
end
