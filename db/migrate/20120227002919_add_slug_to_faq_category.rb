class AddSlugToFaqCategory < ActiveRecord::Migration
  def change
    add_column :faq_categories, :slug, :string
  end
end
