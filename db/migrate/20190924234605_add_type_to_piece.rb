class AddTypeToPiece < ActiveRecord::Migration[5.2]
  def change
    add_column :piece, :type, :string
  end
end
