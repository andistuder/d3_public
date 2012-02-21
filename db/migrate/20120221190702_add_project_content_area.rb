class AddProjectContentArea < ActiveRecord::Migration
  def up
    create_table :project_content_areas do |t|

      t.string :title
      t.text :content
      t.integer :project_id
      t.integer :sort_order
      t.integer :asset_id

      t.timestamps
    end

    remove_column :projects, :left_image_id
    rename_column :projects, :right_image_id, :how_made_image_id
    remove_column :projects, :concept
    add_column :projects, :how_made_title, :text

  end

  def down
    drop_table :project_content_areas

    add_column :projects, :left_image_id, :integer
    rename_column :projects, :how_made_image_id, :right_image_id
    add_column :projects, :concept, :text
    remove_column :projects, :how_made_title
  end

end
