class AddIndexJwtBlacklist < ActiveRecord::Migration[5.2]
  def change
  end
  add_index :jwt_blacklist, :jti
end
