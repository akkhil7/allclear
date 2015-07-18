class AddBodyAndUserToComment < ActiveRecord::Migration
  def change
    add_column :comments, :body, :string
    add_column :comments, :user_id, :integer
  end
end
