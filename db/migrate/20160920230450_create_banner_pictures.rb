class CreateBannerPictures < ActiveRecord::Migration
  def change
    create_table :banner_pictures do |t|
      t.string :picture
      t.references :banner, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
