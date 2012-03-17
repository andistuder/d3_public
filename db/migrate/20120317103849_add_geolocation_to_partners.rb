class AddGeolocationToPartners < ActiveRecord::Migration
  def change
    add_column :partners, :longitude, :decimal
    add_column :partners, :latitude, :decimal
  end
end
