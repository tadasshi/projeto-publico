class AddImageToMetaphors < ActiveRecord::Migration
  def change
    add_column :metaphors, :image, :string
  end
end
