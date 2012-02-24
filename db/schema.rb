# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120224152131) do

  create_table "assets", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.integer  "sort_order"
  end

  create_table "assets_case_studies", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "case_study_id"
  end

  create_table "assets_chapter_content_areas", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "chapter_content_area_id"
  end

  create_table "assets_feature_categories", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "feature_category_id"
  end

  create_table "assets_news_items", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "news_item_id"
  end

  create_table "assets_pages", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "page_id"
  end

  create_table "assets_partner_categories", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "partner_category_id"
  end

  create_table "assets_partners", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "partner_id"
  end

  create_table "assets_projects", :id => false, :force => true do |t|
    t.integer "asset_id"
    t.integer "project_id"
  end

  create_table "case_studies", :force => true do |t|
    t.string   "name"
    t.string   "case_study_category_name"
    t.integer  "sort_order"
    t.string   "slug"
    t.text     "summary"
    t.text     "introduction"
    t.text     "content"
    t.string   "sidebar_title"
    t.text     "sidebar"
    t.integer  "vimeo_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
  end

  create_table "case_studies_features", :id => false, :force => true do |t|
    t.integer "case_study_id"
    t.integer "feature_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_pages", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "page_id"
  end

  create_table "chapter_content_areas", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "sort_order"
    t.integer  "chapter_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "chapters", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "summary"
    t.text     "content"
    t.integer  "sort_order"
    t.integer  "parent_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "content_areas", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "page_id"
    t.integer  "asset_id"
    t.string   "see_more_label"
    t.string   "see_more_url"
  end

  create_table "content_areas_pages", :id => false, :force => true do |t|
    t.integer "page_id"
    t.integer "content_area_id"
  end

  create_table "feature_categories", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "slug"
    t.integer  "sort_order"
    t.integer  "vimeo_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "features", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "slug"
    t.integer  "sort_order"
    t.integer  "feature_category_id"
    t.integer  "asset_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "features_projects", :id => false, :force => true do |t|
    t.integer "feature_id"
    t.integer "project_id"
  end

  create_table "news_items", :force => true do |t|
    t.string   "headline"
    t.text     "summary"
    t.text     "content"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.text     "introduction"
    t.integer  "vimeo_id"
  end

  create_table "partner_categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "sort_order"
    t.string   "see_more_label"
  end

  create_table "partner_content_areas", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "partner_id"
    t.integer  "sort_order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "partners", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.string   "address_line_one"
    t.string   "address_line_two"
    t.string   "town"
    t.string   "country"
    t.string   "postcode"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.string   "website"
    t.text     "summary"
    t.integer  "partner_category_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "logo_id"
  end

  create_table "project_categories", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "summary"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "sort_order"
  end

  create_table "project_categories_projects", :id => false, :force => true do |t|
    t.integer "project_category_id"
    t.integer "project_id"
  end

  create_table "project_content_areas", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "project_id"
    t.integer  "sort_order"
    t.integer  "asset_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "summary"
    t.text     "how_made"
    t.text     "credits_left"
    t.text     "equipment_left"
    t.integer  "how_made_image_id"
    t.integer  "vimeo_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.text     "credits_right"
    t.text     "equipment_right"
    t.text     "how_made_bottom"
    t.integer  "sort_order"
    t.string   "how_made_title"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month"
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",  :null => false
    t.integer  "item_id",    :null => false
    t.string   "event",      :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
