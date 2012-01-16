class Team < ActiveRecord::Base
   has_many:events
   has_many:locations , :through => :events
   
  has_many :members
  has_many :players, :through => :members

end
