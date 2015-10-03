class AddSortOrderColumnToSettings < ActiveRecord::Migration
  def change
    add_column :settings , :sort_order,  :integer
  end
end
