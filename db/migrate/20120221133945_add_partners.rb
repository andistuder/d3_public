class AddPartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :slug

      t.string :address_line_one
      t.string :address_line_two
      t.string :town
      t.string :country
      t.string :postcode

      t.string :company
      t.string :email
      t.string :phone
      t.string :website

      t.text :skills
      t.text :experience_level
      t.text :experience_level
      t.text :projects_worked_on

      t.text :content

      t.integer :partner_category_id

      t.timestamps
    end

    create_table :partner_categories do |t|
      t.string :name
      t.string :slug

      t.text :content

      t.timestamps
    end

    create_table :assets_partner_categories, :id => false do |t|
      t.integer :asset_id
      t.integer :partner_category_id
    end

    create_table :assets_partners, :id => false do |t|
      t.integer :asset_id
      t.integer :partner_id
    end

  end
end
