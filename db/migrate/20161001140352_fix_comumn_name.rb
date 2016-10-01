class FixComumnName < ActiveRecord::Migration
  def change
    rename_column :banner_pictures, :picture, :image
  end
end
