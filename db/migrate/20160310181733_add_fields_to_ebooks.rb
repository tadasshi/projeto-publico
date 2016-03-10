class AddFieldsToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :edition, :string
    add_column :ebooks, :pages, :string
  end
end
