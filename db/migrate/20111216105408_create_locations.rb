class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :nick
      t.string :mapurl
      t.string :address

      t.timestamps
    end
  end
end
