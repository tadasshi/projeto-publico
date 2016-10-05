class AddFacebookToInstitution < ActiveRecord::Migration
  def change
    add_column :institutions, :facebook, :string
  end
end
