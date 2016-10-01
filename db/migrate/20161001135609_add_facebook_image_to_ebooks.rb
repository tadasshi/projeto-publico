class AddFacebookImageToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :facebook_image, :string
  end
end
