class CreateChapterContentAreas < ActiveRecord::Migration
  def change
    create_table :chapter_content_areas do |t|

      t.string :title
      t.text :content
      t.integer :sort_order

      t.references :chapter

      t.timestamps
    end

    create_table :assets_chapter_content_areas, :id => false do |t|
      t.integer :asset_id
      t.integer :chapter_content_area_id
    end

  end



end