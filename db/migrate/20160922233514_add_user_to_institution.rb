class AddUserToInstitution < ActiveRecord::Migration
  def change
    add_reference :institutions, :user, index: true, foreign_key: true
  end
end
