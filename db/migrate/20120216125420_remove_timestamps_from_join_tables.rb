class RemoveTimestampsFromJoinTables < ActiveRecord::Migration
  def up
    remove_column :assets_news_items, :created_at
    remove_column :assets_news_items, :updated_at
    remove_column :assets_pages, :created_at
    remove_column :assets_pages, :updated_at
    remove_column :categories_pages, :created_at
    remove_column :categories_pages, :updated_at
    remove_column :content_areas_pages, :created_at
    remove_column :content_areas_pages, :updated_at

    drop_table :pages_content_areas
  end

  def down
  end
end
