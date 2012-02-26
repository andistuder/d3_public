class CreateFaqCategories < ActiveRecord::Migration
  def change
    create_table :faq_categories do |t|
      t.string :name
      t.integer :sort_order

      t.timestamps
    end

    create_table :faq_categories_faqs, :id => false do |t|
      t.integer :faq_id
      t.integer :faq_category_id
    end

  end
end
