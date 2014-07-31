class RegistrationsController < Devise::RegistrationsController



  private

    def sign_up_params
      allow = [:email, :first_name, :last_name, :school, :sport, :kredits, :password, :password_confirmation, :picture]
      params.require(:user).permit(allow)
    end

end
