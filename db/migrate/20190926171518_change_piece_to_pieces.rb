class ChangePieceToPieces < ActiveRecord::Migration[5.2]
  def change
    rename_table :piece, :pieces
  end
end
