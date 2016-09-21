class Banner < ActiveRecord::Base
  has_many :banner_pictures
  accepts_nested_attributes_for :banner_pictures

end
