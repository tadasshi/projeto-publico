class CreateBibliographies < ActiveRecord::Migration
  def change
    create_table :bibliographies do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :amazon_afiliate_link

      t.timestamps null: true
    end
  end
end
