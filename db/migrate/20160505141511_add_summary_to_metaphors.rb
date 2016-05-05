class AddSummaryToMetaphors < ActiveRecord::Migration
  def change
    add_column :metaphors, :summary, :string
  end
end
