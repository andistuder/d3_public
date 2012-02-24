class AddSortOrderForAssets < ActiveRecord::Migration
  def change
    add_column :assets, :sort_order, :integer
  end
end
