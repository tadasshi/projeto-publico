class AddSummaryToEbooks < ActiveRecord::Migration
  def change
    add_column :ebooks, :summary, :string
  end
end
