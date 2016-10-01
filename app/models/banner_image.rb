class BannerImage < ActiveRecord::Base
  mount_uploader :image, BannerImageUploader
  belongs_to :banner
end
