class ExtraProjectFields < ActiveRecord::Migration
  def change
    create_table :features_projects, :id => false do |t|
      t.integer :feature_id
      t.integer :project_id
    end

    add_column :projects, :credits_right, :text
    add_column :projects, :equipment_right, :text
    add_column :projects, :how_made_bottom, :text
    add_column :projects, :sort_order, :integer

    rename_column :projects, :credits, :credits_left
    rename_column :projects, :equipment, :equipment_left
  end

end
