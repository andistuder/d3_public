class AddDownloadsTable < ActiveRecord::Migration
  def change
    create_table :downloads do |t|

      t.string :name
      t.text :content
      t.string :meta_info
      t.string :slug

      t.integer :download_item_id

      t.timestamps
    end

    create_table :download_categories do |t|
      t.string :name
      t.integer :sort_order
      t.string :slug

      t.timestamps
    end

    create_table :download_categories_downloads, :id => false do |t|
      t.integer :download_id
      t.integer :download_category_id
    end
  end
end
