class Claim < ActiveRecord::Base
	belongs_to :user
	belongs_to :reward
	after_save :approval

	def approval 
	  if self.approved?
		  self.user.update_attributes( :kredit => 
		  	(self.user.kredit - self.reward.kredit) )		 	
		end
	end

end
