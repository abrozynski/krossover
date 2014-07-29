class ClaimsController < ApplicationController

	def create
	    @reward=Reward.find(params[:reward_id])
	    @claim = @reward.claims.build(claim_params)
	 
	    @claim.user_id = current_user.id
	end
	 
	def update
		#which claim? how does it know what a @claim is?
		#Tyler added this
		@claim = Claim.find(params[:id])
	  
	  if @claim.save && @claim.approved?
		  # current_user.kredits -= @reward.kredit
		  u = User.find(@claim.user_id)

		  u.update_attributes( :kredits => (u.kredits - @reward.kredit) )
		 
		  redirect_to reward_path(@reward)
		end
	end

	#I added this
	private
  def user_params
    params.require(:user).permit(:kredit)
  end

end