class RemoveUserIdFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :user_id
  end
end
