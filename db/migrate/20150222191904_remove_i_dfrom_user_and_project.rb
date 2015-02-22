class RemoveIDfromUserAndProject < ActiveRecord::Migration
  def change
    remove_column :users, :project_id
    remove_column :projects, :user_id
  end
end
