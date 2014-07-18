class ReferralsController < ApplicationController

    def new
        @referral = Referral.new
    end

    def create
        
        @referral = Referral.new(referral_params)

        if @referral.save
          ReferralMailer.referral_confirmation(@referral).deliver
          redirect_to new_referral_path, notice: "Thanks for spreading the knowledge!"
        else
          render "new"
          #add message that referral has been generated 
        end
    end

    def show
        @referral = Referral.find(params[:id])
    end

    def index
      @referrals = Referral.all
    end

    def edit
        @referral = Referral.find(params[:id])
    end

    def update
      @referral = Referral.find(params[:id])
     
      if @referral.update(referral_params)
        redirect_to @referral
      else
        render 'edit'
      end
    end

    def destroy
      @referral = Referral.find(params[:id])
      @referral.destroy
      redirect_to referrals_path
    end

    private
      def referral_params
        params.require(:referral).permit(:name, :email, :id)
      end

end