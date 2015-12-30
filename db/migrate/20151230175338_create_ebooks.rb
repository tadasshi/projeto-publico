class CreateEbooks < ActiveRecord::Migration
  def change
    create_table :ebooks do |t|
      t.string :title
      t.text :description
      t.string :image
      t.decimal :value, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
