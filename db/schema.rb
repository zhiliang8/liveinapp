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

ActiveRecord::Schema.define(:version => 20120415145349) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "app_usings", :force => true do |t|
    t.integer  "app_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "apps", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "node_id"
    t.integer  "user_id"
    t.string   "user_name"
    t.string   "node_name"
    t.string   "status",                                         :default => "0"
    t.integer  "trial"
    t.text     "pricing"
    t.string   "pricing_url"
    t.string   "logo"
    t.string   "versions"
    t.integer  "using_user_count",                               :default => 0
    t.integer  "comments_count",                                 :default => 0
    t.text     "desc_html"
    t.text     "pricing_html"
    t.integer  "overall_star",                                   :default => 0,   :null => false
    t.integer  "functional_star",                                :default => 0,   :null => false
    t.integer  "stability_star",                                 :default => 0,   :null => false
    t.integer  "price_star",                                     :default => 0,   :null => false
    t.integer  "rater_count",                                    :default => 0,   :null => false
    t.decimal  "score",            :precision => 2, :scale => 1
  end

  create_table "comments", :force => true do |t|
    t.integer  "app_id"
    t.integer  "user_id"
    t.text     "body"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "votable",    :default => false
  end

  add_index "comments", ["app_id"], :name => "index_comments_on_app_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "feeds", :force => true do |t|
    t.string   "target_type"
    t.integer  "target_id"
    t.text     "raw_data"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "action"
    t.integer  "user_id"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.string   "link"
    t.integer  "app_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "nodes", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "apps_count"
  end

  create_table "pages", :force => true do |t|
    t.string   "slug"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 5
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "rates", :force => true do |t|
    t.integer  "rater_id"
    t.string   "stars",       :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_status"
    t.text     "body"
    t.integer  "app_id"
  end

  add_index "rates", ["rater_id"], :name => "index_rates_on_rater_id"

  create_table "users", :force => true do |t|
    t.string   "name",                                                  :null => false
    t.string   "email",                                                 :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "website"
    t.string   "tags"
    t.integer  "using_app_count",                       :default => 0
    t.integer  "apps_count",                            :default => 0
    t.datetime "reset_password_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
