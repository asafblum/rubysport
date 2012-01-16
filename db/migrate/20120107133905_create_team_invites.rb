class CreateTeamInvites < ActiveRecord::Migration
  def change
    create_table :team_invites do |t|
      t.string :body
      t.string :invitee_email
      t.references :event
      t.references :member

      t.timestamps
    end
    add_index :team_invites, :member_id
    add_index :team_invites, :event_id
  end
end
