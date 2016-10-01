class BannerImage < ActiveRecord::Base
  mount_uploader :picture, BannerImageUploader
  belongs_to :banner
end
