class Reward < ActiveRecord::Base
has_many :claims
	mount_uploader :image, ImageUploader
end
