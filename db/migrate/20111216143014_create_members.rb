class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :team
      t.references :player
      t.boolean :is_admin

      t.timestamps
    end
    add_index :members, :team_id
    add_index :members, :player_id
  end
end
