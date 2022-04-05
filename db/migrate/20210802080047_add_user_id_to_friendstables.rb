class AddUserIdToFriendstables < ActiveRecord::Migration[6.1]
  def change
    add_column :friendstables, :user_id, :integer
    add_index :friendstables, :user_id
  end
end
