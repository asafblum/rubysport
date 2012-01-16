class AddpasswordDigestToPlayers < ActiveRecord::Migration
  def down
    remove_column :players, :password_digest
  end
 
  def up
    add_column :players, :password_digest, :string
  end
end
