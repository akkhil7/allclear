class CreateTeamworks < ActiveRecord::Migration
  def change
    create_table :teamworks do |t|

      t.timestamps null: false
    end
  end
end
