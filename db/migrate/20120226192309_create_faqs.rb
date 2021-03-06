class CreateFaqs < ActiveRecord::Migration
  def change
    create_table :faqs do |t|
      t.text :question
      t.text :answer
      t.string :slug

      t.integer :sort_order

      t.timestamps
    end
  end
end
