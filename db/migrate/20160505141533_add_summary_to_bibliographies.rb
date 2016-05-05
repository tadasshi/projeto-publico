class AddSummaryToBibliographies < ActiveRecord::Migration
  def change
    add_column :bibliographies, :summary, :string
  end
end
