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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190210165922) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "oyacategory_id", limit: 4
  end

  add_index "categories", ["oyacategory_id"], name: "index_categories_on_oyacategory_id", using: :btree
  add_index "categories", ["user_id"], name: "index_categories_on_user_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.text     "text",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imagetexts", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.text     "content",    limit: 65535
    t.string   "image",      limit: 255
    t.integer  "status",     limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "subtitle",   limit: 255
  end

  add_index "imagetexts", ["post_id"], name: "index_imagetexts_on_post_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "mypage_comments", force: :cascade do |t|
    t.string   "text",       limit: 255
    t.integer  "userpage",   limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "mypage_comments", ["user_id"], name: "index_mypage_comments_on_user_id", using: :btree
  add_index "mypage_comments", ["userpage"], name: "index_mypage_comments_on_userpage", using: :btree

  create_table "oyacategories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "oyacategories", ["user_id"], name: "index_oyacategories_on_user_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "title",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "likes_count",    limit: 4,   default: 0
    t.integer  "comments_count", limit: 4,   default: 0
    t.string   "youtube",        limit: 255
    t.string   "series",         limit: 255
    t.integer  "unread",         limit: 4,   default: 0
  end

  add_index "posts", ["user_id"], name: "fk_rails_5b5ddfd518", using: :btree

  create_table "posttools", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "tool_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "posttools", ["post_id"], name: "index_posttools_on_post_id", using: :btree
  add_index "posttools", ["tool_id"], name: "index_posttools_on_tool_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "tools", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id",     limit: 4
    t.integer  "category_id", limit: 4
  end

  add_index "tools", ["category_id"], name: "index_tools_on_category_id", using: :btree
  add_index "tools", ["user_id"], name: "index_tools_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.text     "introduction",           limit: 65535
    t.string   "nickname",               limit: 255
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.string   "provider",               limit: 255
    t.string   "accesstoken",            limit: 255
    t.string   "secrettoken",            limit: 255
    t.integer  "likes_count",            limit: 4,     default: 0
    t.integer  "unread",                 limit: 4,     default: 0
    t.string   "twitter_account",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "categories", "oyacategories"
  add_foreign_key "categories", "users"
  add_foreign_key "imagetexts", "posts"
  add_foreign_key "mypage_comments", "users"
  add_foreign_key "oyacategories", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "posttools", "posts"
  add_foreign_key "posttools", "tools"
  add_foreign_key "tools", "categories"
  add_foreign_key "tools", "users"
end
