class AddPartnerContentAreas < ActiveRecord::Migration
  def change
    rename_column :partners, :content, :summary
  end
end
