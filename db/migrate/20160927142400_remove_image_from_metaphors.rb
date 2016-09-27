class RemoveImageFromMetaphors < ActiveRecord::Migration
  def change
    remove_column :metaphors, :image, :string
  end
end
