class PaperclipfieldsForDownloads < ActiveRecord::Migration
  def self.up

    remove_column :downloads, :download_item_id
    remove_column :downloads, :meta_info

    change_table :downloads do |t|
      t.has_attached_file :item
    end
  end

  def self.down
    drop_attached_file :users, :item

    add_column :downloads, :download_item_id, :integer
    add_column :downloads, :meta_info, :string

  end
end
