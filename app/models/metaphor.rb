class Metaphor < ActiveRecord::Base
  validates :title, presence: true
  mount_uploader :image, AvatarUploader

  # Make url friendly using title
  def to_param
    "#{id} #{title}".parameterize
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%")
  end
end
