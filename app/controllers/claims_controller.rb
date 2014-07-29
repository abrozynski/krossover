class ClaimsController < ApplicationController

def create
    @reward=Reward.find(params[:reward_id])
    @claim = @reward.claims.build(claim_params)
 
    @claim.user_id = current_user.id
end
 
def update
    if @claim.save && @claim.approved?
    # current_user.kredits -= @reward.kredit
    current_user.update_attributes( :kredits => (current_user.kredits - @reward.kredit) )
   
    redirect_to reward_path(@reward)
end

end