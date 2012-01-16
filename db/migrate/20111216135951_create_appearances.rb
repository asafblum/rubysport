class CreateAppearances < ActiveRecord::Migration
  def change
    create_table :appearances do |t|
      t.integer :friends
      t.integer :points
      t.integer :rsvp
      t.references :player

      t.timestamps
    end
    add_index :appearances, :player_id
  end
end
