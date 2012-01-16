class AddInvitationToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :invitation_id, :integer
    add_column :players, :invitation_limit, :integer
  end
end
