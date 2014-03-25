class AddUserIdToFish < ActiveRecord::Migration
  def change
    add_column :fish, :user_id, :integer
    add_index :fish, :user_id
  end
end
