class AddSortOrdertoProjectCategories < ActiveRecord::Migration
  def change
    add_column :project_categories, :sort_order, :integer
  end
end
