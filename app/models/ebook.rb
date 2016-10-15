class Ebook < ActiveRecord::Base

  mount_uploader :image, EbookCoverUploader
  mount_uploader :facebook_image, FacebookImageUploader

  validates :title, :url, presence: true
  validates :value, numericality: {greater_than: 0}
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
