class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.string :headline
      t.text :summary
      t.text :content
      t.string :slug

      t.timestamps
    end
  end

end