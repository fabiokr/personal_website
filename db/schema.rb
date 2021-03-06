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

ActiveRecord::Schema.define(:version => 20110822202420) do

  create_table "admin_page_contents", :force => true do |t|
    t.integer  "page_id"
    t.string   "key"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_page_contents", ["page_id", "key"], :name => "index_admin_page_contents_on_page_id_and_key", :unique => true
  add_index "admin_page_contents", ["page_id"], :name => "index_admin_page_contents_on_page_id"

  create_table "admin_pages", :force => true do |t|
    t.string   "controller_path"
    t.string   "title"
    t.string   "description"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
  end

  add_index "admin_pages", ["controller_path", "locale"], :name => "index_admin_pages_on_controller_path_and_locale", :unique => true

  create_table "admin_users", :force => true do |t|
    t.string   "email",               :default => "", :null => false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true

  create_table "blog_articles", :force => true do |t|
    t.string   "title"
    t.string   "slug"
    t.string   "description"
    t.string   "keywords"
    t.text     "excerpt"
    t.text     "body"
    t.datetime "published_at"
    t.boolean  "highlight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "locale"
  end

  add_index "blog_articles", ["highlight"], :name => "index_blog_articles_on_highlight"
  add_index "blog_articles", ["published_at", "locale"], :name => "index_blog_articles_on_published_at_and_locale"
  add_index "blog_articles", ["published_at"], :name => "index_blog_articles_on_published_at"
  add_index "blog_articles", ["slug"], :name => "index_blog_articles_on_slug"

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                                 :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 25
    t.string   "guid",              :limit => 10
    t.integer  "locale",            :limit => 2,  :default => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "fk_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_assetable_type"
  add_index "ckeditor_assets", ["user_id"], :name => "fk_user"

  create_table "manageable_content_page_contents", :force => true do |t|
    t.integer  "page_id"
    t.string   "key"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "short",      :default => false
  end

  add_index "manageable_content_page_contents", ["page_id", "key"], :name => "index_manageable_content_page_contents_on_page_id_and_key", :unique => true

  create_table "manageable_content_pages", :force => true do |t|
    t.string   "key"
    t.string   "locale"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manageable_content_pages", ["key", "locale"], :name => "index_manageable_content_pages_on_key_and_locale", :unique => true

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

end
