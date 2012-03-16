class HbtmCategoriesNewsItems < ActiveRecord::Migration
  def change
    create_table :categories_news_items, :id => false do |t|
      t.integer :category_id
      t.integer :news_item_id
    end
  end
end
