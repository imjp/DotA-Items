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

ActiveRecord::Schema.define(:version => 20120130052135) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer   "resource_id",   :null => false
    t.string    "resource_type", :null => false
    t.integer   "author_id"
    t.string    "author_type"
    t.text      "body"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "builds", :force => true do |t|
    t.string    "name"
    t.integer   "starting_item_1"
    t.integer   "early_item_1"
    t.integer   "core_item_1"
    t.integer   "situational_item_1"
    t.integer   "hero_id"
    t.integer   "user_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "slug"
    t.integer   "starting_item_2"
    t.integer   "starting_item_3"
    t.integer   "starting_item_4"
    t.integer   "starting_item_5"
    t.integer   "starting_item_6"
    t.integer   "early_item_2"
    t.integer   "early_item_3"
    t.integer   "early_item_4"
    t.integer   "early_item_5"
    t.integer   "early_item_6"
    t.integer   "core_item_2"
    t.integer   "core_item_3"
    t.integer   "core_item_4"
    t.integer   "core_item_5"
    t.integer   "core_item_6"
    t.integer   "situational_item_2"
    t.integer   "situational_item_3"
    t.integer   "situational_item_4"
    t.integer   "situational_item_5"
    t.integer   "situational_item_6"
    t.text      "guide"
  end

  add_index "builds", ["hero_id"], :name => "index_builds_on_hero_id"
  add_index "builds", ["slug"], :name => "index_builds_on_slug", :unique => true
  add_index "builds", ["user_id"], :name => "index_builds_on_user_id"

  create_table "builds_items", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "build_id"
  end

  create_table "heros", :force => true do |t|
    t.string    "name"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "category"
  end

  add_index "heros", ["slug"], :name => "index_heros_on_slug", :unique => true

  create_table "items", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.string    "cost"
    t.text      "active"
    t.text      "bonus"
    t.string    "category"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "slug"
    t.text      "passive"
    t.string    "index_name"
    t.integer   "recipe_item_1"
    t.integer   "recipe_item_2"
    t.integer   "recipe_item_3"
    t.integer   "recipe_item_4"
  end

  add_index "items", ["slug"], :name => "index_items_on_slug", :unique => true

  create_table "items_builds", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "build_id"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                                 :default => "", :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end