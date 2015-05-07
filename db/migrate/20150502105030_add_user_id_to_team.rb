class AddUserIdToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :created_by_id, :integer
    add_index :teams, [:user_id, :created_by_id]

    remove_column :teams, :friend_id
  end
end
