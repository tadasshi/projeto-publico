class AddImageToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :image, :string
  end
end
