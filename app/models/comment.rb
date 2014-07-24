class Comment < ActiveRecord::Base
  belongs_to :article

  after_create :award_user

  def award_user
  	 current_user.kredits += 5
  end

end
