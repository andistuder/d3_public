class AddCaseStudies < ActiveRecord::Migration
  def change

    create_table :case_studies do |t|
      t.string :name
      t.string :case_study_category_name
      t.integer :sort_order

      t.string :slug
      t.text :summary
      t.text :introduction
      t.text :content
      t.string :sidebar_title
      t.text :sidebar

      t.integer :vimeo_id

      t.timestamps
    end

    create_table :assets_case_studies, :id => false do |t|
      t.integer :asset_id
      t.integer :case_study_id
    end

    create_table :case_studies_features, :id => false do |t|
      t.integer :case_study_id
      t.integer :feature_id
    end

  end
end
