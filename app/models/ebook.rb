class Ebook < ActiveRecord::Base
  validates :title, presence: true
  validates :value, numericality: {greater_than: 0}

  # Make url friendly using title
  def to_param
    "#{id} #{title}".parameterize
  end
end
