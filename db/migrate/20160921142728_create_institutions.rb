class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :website
      t.text :description
      t.string :website

      t.timestamps null: false
    end
  end
end
