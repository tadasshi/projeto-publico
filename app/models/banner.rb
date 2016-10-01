class Banner < ActiveRecord::Base
  has_many :banner_images
  accepts_nested_attributes_for :banner_images

end
