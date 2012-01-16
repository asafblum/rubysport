class Event < ActiveRecord::Base
    belongs_to :location
  belongs_to :team


 #has_many :appearances
   def starttime_formatted
    self.starttime.strftime('%d.%m.%Y %H:%M') if self.starttime?
 end

 def starttime_formatted=(value)
    self.starttime = Time.zone.parse(value)
 end
  
end
