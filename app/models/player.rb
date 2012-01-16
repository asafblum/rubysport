class Player < ActiveRecord::Base
  has_secure_password
  #attr_accessible :email, :password, :password_confirmation
  # validates:password, :length => { :minimum => 10 }
  has_many :appearances
    has_many  :members
    has_many :sent_invitations, :class_name => 'Invitation', :foreign_key => 'sender_id'
  belongs_to :invitation
    has_many :teams, :through => :members
accepts_nested_attributes_for :members
  #attr_accessor :password
  #validates_confirmation_of :password
  #validates_presence_of :password, :on => :create
  #validates_presence_of :email
  #validates_uniqueness_of :email
def invitation_token
  invitation.token if invitation
end

def invitation_token=(token)
  self.invitation = Invitation.find_by_token(token)
end

private

def set_invitation_limit
  self.invitation_limit = 5
end




  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
