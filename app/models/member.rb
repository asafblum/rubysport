class Member < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  has_many :team_invites
end
