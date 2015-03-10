class AddUsersArrayToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :users, :string
  end
end
