class AddOverlayTextFieldToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :overlay_text, :text
  end
end
