class RegistrationsController < Devise::RegistrationsController



  private

    def sign_up_params
      allow = [:email, :first_name, :last_name, :school_name, :sport, :kredits, :password, :password_confirmation, :picture]
      params.require(:user).permit(allow)
    end

end
