class AddUrlToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :url, :string
  end
end
