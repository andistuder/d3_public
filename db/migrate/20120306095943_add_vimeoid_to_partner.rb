class AddVimeoidToPartner < ActiveRecord::Migration
  def change
    add_column :partners, :vimeo_id, :integer
  end
end
