# class EmailCheck < RegistrationsController::Devise
#     YAML.load(File.read('config/environments/local_env.yml')).each {|k, v|  ENV[k.to_s] = v}
#       include HTTParty
#       format :json
#       base_uri 'app.close.io'
#       basic_auth ENV["API_KEY"], ' '
#       response = Lead.get('/api/v1/contact/')
#       @email_database = []
#       response['data'].each do |x|
#         x['emails'].each do |contact_info|
#             @email_database << contact_info['email']
#         end
#     end
# end
