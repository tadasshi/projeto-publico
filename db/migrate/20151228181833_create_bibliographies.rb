class CreateBibliographies < ActiveRecord::Migration
  def change
    create_table :bibliographies do |t|
      t.string :title
      t.string :slug
      t.text :description
      t.string :amazon_afiliate_link
      t.string :image

      t.timestamps null: false
    end
  end
end
