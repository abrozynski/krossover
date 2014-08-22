class RegistrationsController < Devise::RegistrationsController


#second try at email check with API is below 


    #   def email_checker(email)
        
    #   #   api_options = {
    #   # #     query: :output => 'json',
    #   # #     format: :json,
    #   #     base_uri: 'app.close.io',
    #   #     basic_auth: "d4a4d51ccccfddb1b45ac8967d43989f5a4db6efe538715b1660d8ad:", ' '
    #   # }
    
    #     @response = HTTParty.get("https://app.close.io/api/v1/contact/",basic_auth: { username: "d4a4d51ccccfddb1b45ac8967d43989f5a4db6efe538715b1660d8ad:"}) 
    #     @email_database = []
    #     @response['data'].each do |x| 
    #       x['emails'].each do |contact_info|
    #           @email_database << contact_info['email']
    #         end
    #     end

    #     # ENV["API_KEY"]
    #     #YAML.load(File.read('config/environments/local_env.yml')).each {|k, v|  ENV[k.to_s] = v}

    #     unless @email_database.include? email 
    #         return false
    #     else
    #         return true 
    #     end
    #   end


    # def create
    #     super 
        
    #     if email_checker(params[:email]) == false 

    #         redirect_to users_path, flash: {info: "I'm sorry, it doesn't look like you're a Krossover cutsomter" } and return 
    #         #and return to signup with errors
    #     else 
    #         User.save!
    #     end
    # end



        # protected 
    # def after_sign_in_path_for(resource)
    #     '/users/#{current_user.slug}'
    # end

    #first try at emailcheck with API is below 

  # def email_checker(email)
  #       YAML.load(File.read('config/environments/local_env.yml')).each {|k, v|  ENV[k.to_s] = v}
  #       # include HTTParty   
  #       # default_params :output => 'json'
  #       # format :json
  #       # base_uri 'app.close.io'
  #       # basic_auth ENV["API_KEY"], ' '
  #       response = HTTParty.get('https://app.close.io/api/v1/contact/', :basic_auth => {:username => ENV["API_KEY"], :password => ' '})
  #       debugger
  #       debugger
  #       @email_database = []
  #       response['data'].each do |x| 
  #         x['emails'].each do |contact_info|
  #             @email_database << contact_info['email']
  #           end
  #       end
  #       debugger
  #       debugger
  #       unless @email_database.include? email 
  #         # errors.add email, 'According to our records, you are not a Krossover customer.  Sign up at Krossover.com!'
  #         return false
  #       else
  #           return true
  #       end
  # end 

  #   def create
#     email = params["user"]["email"]
#     is_in_database = email_checker(email)
#     debugger
#     debugger
#     return unless is_in_database
#     super
#     # before_create :email_checker
    
#   end

# # before_save :email_checker




    private

    def sign_up_params
      allow = [:email, :first_name, :last_name, :school_name, :sport, :kredits, :password, :password_confirmation, :picture, :bio]
      params.require(:user).permit(allow)
    end

end
