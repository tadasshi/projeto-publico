class AddAddressToInstitution < ActiveRecord::Migration
  def change
    add_reference :institutions, :state, index: true, foreign_key: true
    add_reference :institutions, :city, index: true, foreign_key: true
    add_column :institutions, :address, :string
    add_column :institutions, :number, :string
    add_column :institutions, :cep, :string
  end
end
