class Bibliography < ActiveRecord::Base
  validates :title, presence: true

  # Make url friendly using title
  def to_param
    "#{id} #{title}".parameterize
  end
end
