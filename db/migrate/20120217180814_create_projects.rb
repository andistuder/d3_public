class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug
      t.text :summary
      t.text :concept
      t.text :how_made
      t.text :credits
      t.text :equipment

      t.integer :left_image_id
      t.integer :right_image_id
      t.integer :vimeo_id

      t.timestamps
    end

    create_table :assets_projects, :id => false do |t|
      t.integer :asset_id
      t.integer :project_id
    end

    create_table :project_categories do |t|
      t.string :name
      t.string :slug
      t.text :summary
      t.text :content

      t.timestamps
    end

    create_table :project_categories_projects, :id => false do |t|
      t.integer :project_category_id
      t.integer :project_id
    end
  end
end
