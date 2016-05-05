class AddSummaryToBiographies < ActiveRecord::Migration
  def change
    add_column :biographies, :summary, :string
  end
end
