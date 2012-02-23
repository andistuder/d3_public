class AddLogoFieldToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :logo_id, :integer
    add_column :partner_categories, :see_more_label, :string
  end
end
