class Reward < ActiveRecord::Base
has_many :claims
has_many :users, through: :claims
	mount_uploader :image, ImageUploader
end
