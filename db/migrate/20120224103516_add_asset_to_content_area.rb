class AddAssetToContentArea < ActiveRecord::Migration
  def change
    add_column :content_areas, :asset_id, :integer
    add_column :content_areas, :see_more_label, :string
    add_column :content_areas, :see_more_url, :string
    add_column :pages, :introduction, :text
    add_column :pages, :vimeo_id, :integer
  end
end
