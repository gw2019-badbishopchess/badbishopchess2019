class AddGtiAndIndexToJtiBlacklist < ActiveRecord::Migration[5.2]
  def change
    add_column :jwt_blacklist, :jti, :string, null: false
    add_column :jwt_blacklist, :exp, :datetime, null: false
    remove_column :jwt_blacklist, :created_at
    remove_column :jwt_blacklist, :updated_at
  end
end
