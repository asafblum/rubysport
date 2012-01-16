class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :nick
      t.string :blogurl

      t.timestamps
    end
  end
end
