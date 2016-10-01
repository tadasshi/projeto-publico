class FixTableName < ActiveRecord::Migration
  def change
    rename_table :banner_pictures, :banner_images
  end
end
