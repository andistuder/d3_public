class ChangeHowToTitle < ActiveRecord::Migration
  def up
    remove_column :projects, :how_made_title
    add_column :projects, :how_made_title, :string
  end

  def down
    remove_column :projects, :how_made_title
    add_column :projects, :how_made_title, :text
  end
end
