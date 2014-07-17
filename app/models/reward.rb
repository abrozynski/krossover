class Reward < ActiveRecord::Base
	mount_uploader :image, ImageUploader
end
