

class Referral < ActiveRecord::Base
	belongs_to  :user

    validates :name, :presence => true, :length => { :maximum => 25 }
    validates :last_name, :presence => true, :length => { :maximum => 25 }
    validates :email, :presence => true, :email => true

end