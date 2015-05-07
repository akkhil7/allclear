class RemoveIndexFromTeam < ActiveRecord::Migration
  def change
    remove_index :teams, :column => [:user_id, :created_by_id]
  end
end
