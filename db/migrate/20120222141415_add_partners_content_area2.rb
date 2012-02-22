class AddPartnersContentArea2 < ActiveRecord::Migration

  def up
    create_table :partner_content_areas do |t|
      t.string :title
      t.text :content
      t.integer :partner_id
      t.integer :sort_order

      t.timestamps
    end

    remove_column :partners, :skills
    remove_column :partners, :experience_level
    remove_column :partners, :projects_worked_on
  end

  def down
    drop_table :partner_content_areas
    add_column :partners, :skills, :text
    add_column :partners, :experience_level, :text
    add_column :partners, :projects_worked_on, :text
  end
end
