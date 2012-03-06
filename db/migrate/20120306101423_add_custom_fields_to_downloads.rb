class AddCustomFieldsToDownloads < ActiveRecord::Migration
  def change
    add_column :downloads, :see_more_label, :string
    add_column :downloads, :see_more_url, :string
    add_column :downloads, :summary, :text
  end
end
