class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :name
      t.string :slug
      t.text :summary
      t.text :content

      t.integer :sort_order
      t.integer :parent_id

      t.timestamps
    end
  end
end
