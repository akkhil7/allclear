class DropUnwantedTables < ActiveRecord::Migration
  def change
    drop_table :teams
    drop_table :teamworks
  end
end
