class DropJwtBlacklist2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :jwt_blacklist
  end
end
