class AddPriorityToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :priority, :string
  end
end
