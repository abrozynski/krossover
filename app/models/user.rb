class User < ActiveRecord::Base
has_many :points  
has_many :badges, :through => :levels 
has_many :levels
has_many :claims
has_many :rewards, through: :claims

mount_uploader :picture, ImageUploader


#before_validation :email_checker


# class Lead
  # def email_checker
  #       YAML.load(File.read('config/environments/local_env.yml')).each {|k, v|  ENV[k.to_s] = v}
  #       include HTTParty   
  #       default_params :output => 'json'
  #       format :json
  #       base_uri 'app.close.io'
  #       basic_auth ENV["API_KEY"], ' '
  #       response = HTTParty.get('/api/v1/contact/')
        
  #       @email_database = []
  #       response['data'].each do |x|
  #         x['emails'].each do |contact_info|
  #             @email_database << contact_info['email']
  #           end
  #           end
    
  #           unless @email_database.include? :email 
  #             errors.add :email, 'According to our records, you are not a Krossover customer.  Sign up at Krossover.com!'
  #           end
  
  # end 
# end


extend FriendlyId
friendly_id :slug_candidates, use: :slugged

after_create :initialize_points

def slug_candidates
    [
      :last_name,
      [:last_name, :first_name],
      [:last_name, :first_name, :school_name]
    ]
end

def initialize_points
  @point = Point.new(user_id: self.id, value: 0)
  @point.save
end

def change_points(options)
  if Gioco::Core::KINDS
    points = options[:points]
    kind   = Kind.find(options[:kind])
  else
    points = options
    kind   = false
  end

  if Gioco::Core::KINDS
    raise "Missing Kind Identifier argument" if !kind
    old_pontuation = self.points.where(:kind_id => kind.id).sum(:value)
  else
    old_pontuation = self.points.to_i
  end
  new_pontuation = old_pontuation + points
  Gioco::Core.sync_resource_by_points(self, new_pontuation, kind)
end

def next_badge?(kind_id = false)
  if Gioco::Core::KINDS
    raise "Missing Kind Identifier argument" if !kind_id
    old_pontuation = self.points.where(:kind_id => kind_id).sum(:value)
  else
    old_pontuation = self.points.to_i
  end
  next_badge       = Badge.where("points > #{old_pontuation}").order("points ASC").first
  last_badge_point = self.badges.last.try('points')
  last_badge_point ||= 0

  if next_badge
    percentage      = (old_pontuation - last_badge_point)*100/(next_badge.points - last_badge_point)
    points          = next_badge.points - old_pontuation
    next_badge_info = {
                        :badge      => next_badge,
                        :points     => points,
                        :percentage => percentage
                      }
  end
end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :referrals


end
