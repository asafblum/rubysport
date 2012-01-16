class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :starttime
      t.references :location
      t.references :appearance
      t.references :team

      t.timestamps
    end
    add_index :events, :location_id
    add_index :events, :appearance_id
    add_index :events, :team_id
  end
end
