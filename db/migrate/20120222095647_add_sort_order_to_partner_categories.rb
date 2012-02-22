class AddSortOrderToPartnerCategories < ActiveRecord::Migration
  def change
    add_column :partner_categories, :sort_order, :integer
  end
end
