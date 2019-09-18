class CreatePieces < ActiveRecord::Migration[5.2]
  def change
    create_table :pieces do |t|
      t.integer :piece_id
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
    end
    add_index :pieces, :piece_id
    add_index :pieces, :player_id
  end
end
