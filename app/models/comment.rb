class Comment < ActiveRecord::Base
  belongs_to :article
  
  
#  after_create :award_user

end
