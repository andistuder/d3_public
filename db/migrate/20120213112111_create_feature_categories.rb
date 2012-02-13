class CreateFeatureCategories < ActiveRecord::Migration
  def change

    create_table :feature_categories do |t|
      t.string :name
      t.text :content
      t.string :slug
      t.integer :sort_order
      t.integer :vimeo_id

      t.timestamps
    end

    create_table :features do |t|
      t.string :name
      t.text :content
      t.string :slug
      t.integer :sort_order
      t.integer :feature_category_id
      t.integer :asset_id

      t.timestamps
    end

    create_table :assets_feature_categories, :id => false do |t|
      t.integer :asset_id
      t.integer :feature_category_id
    end

  end
end
