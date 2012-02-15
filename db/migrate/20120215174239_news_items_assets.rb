class NewsItemsAssets < ActiveRecord::Migration
  def change
    create_table :assets_news_items, :id => false do |t|
      t.integer :asset_id
      t.integer :news_item_id

      t.timestamps
    end
  end

end