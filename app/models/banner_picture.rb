class BannerPicture < ActiveRecord::Base
  mount_uploader :picture, BannerPictureUploader
  belongs_to :banner
end
