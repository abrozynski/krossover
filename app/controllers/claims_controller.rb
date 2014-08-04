class ClaimsController < ApplicationController

	def create
	    @reward = Reward.find(params[:reward_id])
	    @claim = @reward.claims.build(claim_params)
	 	  @claim.user_id = current_user.id
	 	  @claim.user_last_name = current_user.last_name

	 	  if @claim.save 
	 	  	  ClaimMailer.claim_confirmation(@claim).deliver
          #redirect_to rewards_url, notice: "Congrats on earning your reward!"
          redirect_to claim_path(@claim)  
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
    params.require(:claim).permit(:kredit, :user_id, :user_last_name, :reward_id)
  end

end