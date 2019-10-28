class ChgJwtBlacklistsTojwtBlacklist < ActiveRecord::Migration[5.2]
  def change
    rename_table :jwt_blacklists, :jwt_blacklist
  end
end
