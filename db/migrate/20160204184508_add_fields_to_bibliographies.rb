class AddFieldsToBibliographies < ActiveRecord::Migration
  def change
    add_column :bibliographies, :year, :string
    add_column :bibliographies, :author, :string
    add_column :bibliographies, :pages, :string
    add_column :bibliographies, :thickness, :string
  end
end
