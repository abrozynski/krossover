class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :referrals

#  include RoleModel

#  attr_accessible :email, :password, :password_confirmation, :school_name, :sport, :roles, :roles_mask

#  roles_attribute :roles_mask

#  roles :admin, :coach, :guest

  def award_kredit(amount)
    self.kredit = self.kredit + amount
  end

  def deduct_kredit(amount)
    self.kredit = self.kredit - amount
  end

end
