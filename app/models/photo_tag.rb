class PhotoTag < ActiveRecord::Base
	belongs_to :inst_tag
	belongs_to :user_photop
end
