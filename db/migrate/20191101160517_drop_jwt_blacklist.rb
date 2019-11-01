class DropJwtBlacklist < ActiveRecord::Migration[5.2]
  def change
    def up
    drop_table :jwt_blacklist
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
  end
end
