class ClaimsController < ApplicationController

	def create
	    @reward = Reward.find(params[:reward_id])
	    @claim = @reward.claims.build(claim_params)
	 	  @claim.user_id = current_user.id

	 	  if @claim.save 
	 	    redirect_to rewards_url
	 	  end
	end
	 
	def update
		@claim = Claim.find(params[:id])

	  if @claim.save && @claim.approved?

		  @claim.user.update_attributes( :kredit => 
		  	(@claim.user.kredit - @claim.reward.kredit) )		 	

		  redirect_to reward_path(@reward)
		end
	end

	private
  def claim_params
    params.require(:claim).permit(:kredit, :user_id, :reward_id)
  end

end