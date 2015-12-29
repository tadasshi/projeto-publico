class Bibliography < ActiveRecord::Base
  # Make url friendly using title
  def to_param
    "#{id} #{title}".parameterize
  end
end
