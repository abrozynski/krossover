class RegistrationsController < Devise::RegistrationsController
    # protected 
    # def after_sign_in_path_for(resource)
    #     '/users/#{current_user.slug}'
    # end

  private

    def sign_up_params
      allow = [:email, :first_name, :last_name, :school_name, :sport, :kredits, :password, :password_confirmation, :picture]
      params.require(:user).permit(allow)
    end

end
