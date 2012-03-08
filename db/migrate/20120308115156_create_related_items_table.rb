class CreateRelatedItemsTable < ActiveRecord::Migration
  def change
    create_table :related_boxes do |t|

      t.string :name
      t.text :content
      t.string :link_label
      t.string :link_url

      t.integer :sort_order
      t.integer :asset_id

      t.timestamps
    end

    create_table :pages_related_boxes, :id => false do |t|
      t.integer :page_id
      t.integer :related_box_id
    end
  end
end
