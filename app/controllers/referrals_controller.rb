class ReferralsController < ApplicationController

  load_and_authorize_resource
  skip_load_and_authorize_resource :only => [:new, :create, :update]

    def new
        @referral = Referral.new
    end

    def create
        @referral = Referral.new(referral_params)
        @referral.user_id = current_user.id
        if @referral.save
          ReferralMailer.referral_confirmation(@referral).deliver
          redirect_to new_referral_path, notice: "Thanks for spreading the knowledge!"
        else
          render "new"
          #add message that referral has been generated 
        end    end

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
        params.require(:referral).permit(:name, :last_name, :phone_number, :school, :sport, :email, :id, :user_id, :kredit)
      end

end