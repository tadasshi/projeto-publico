class Post < ActiveRecord::Base

  mount_uploader :image, AvatarUploader

  validates :title, :description, :summary, presence: true
  validates :summary, length: { maximum: 155 }

  # Make url friendly using title
  def to_param
    "#{id} #{title}".parameterize
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("lower(title) like ?", "%#{query.downcase}%")
  end
end
