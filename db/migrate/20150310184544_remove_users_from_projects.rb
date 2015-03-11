class RemoveUsersFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :users
  end
end
