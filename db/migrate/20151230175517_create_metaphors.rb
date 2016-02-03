class CreateMetaphors < ActiveRecord::Migration
  def change
    create_table :metaphors do |t|
      t.string :title
      t.text :description

      t.timestamps null: true
    end
  end
end
