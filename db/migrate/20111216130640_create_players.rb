class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :nick
      t.string :email
      
      t.timestamps
    end
  end
end
