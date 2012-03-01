class AddWorkflowPage < ActiveRecord::Migration
  def change
    create_table :workflow_items do |t|

      t.string :title
      t.string :list_title

      t.text :content_area
      t.text :list_area
      t.text :overlay

      t.integer :sort_order
      t.integer :asset_id

      t.timestamps
    end
  end
end
