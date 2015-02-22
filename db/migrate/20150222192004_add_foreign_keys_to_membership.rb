class AddForeignKeysToMembership < ActiveRecord::Migration
  def change
    add_column :memberships, :user_id, :int
    add_column :memberships, :project_id, :int
    add_index :memberships, :user_id
    add_index :memberships, :project_id
  end
end
