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

ActiveRecord::Schema.define(version: 20160531184334) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "acces_token"
    t.string   "id_ins"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "followeds", force: :cascade do |t|
    t.string   "username"
    t.string   "ins_id"
    t.boolean  "is_follow",  default: true
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "followers", force: :cascade do |t|
    t.string   "username"
    t.string   "ins_id"
    t.boolean  "toFollows"
    t.integer  "user_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "is_follow",  default: true
  end

  create_table "inst_relations", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "inst_relations", ["followed_id"], name: "index_inst_relations_on_followed_id", using: :btree
  add_index "inst_relations", ["follower_id", "followed_id"], name: "index_inst_relations_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "inst_relations", ["follower_id"], name: "index_inst_relations_on_follower_id", using: :btree

  create_table "inst_tags", force: :cascade do |t|
    t.string   "name"
    t.integer  "media_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "inst_tokens", force: :cascade do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "insta_users", force: :cascade do |t|
    t.string   "username"
    t.string   "ins_id"
    t.integer  "user_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "profile_picture"
    t.string   "last_photo",      default: "0"
  end

  create_table "photo_tags", force: :cascade do |t|
    t.integer  "inst_tag_id"
    t.integer  "user_photo_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tag_relations", force: :cascade do |t|
    t.integer  "insta_user_id"
    t.integer  "inst_tag_id"
    t.integer  "counter"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_photo_relations", force: :cascade do |t|
    t.integer  "insta_user_id"
    t.integer  "user_photo_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "user_photos", force: :cascade do |t|
    t.string   "url"
    t.string   "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "have_authorization",     default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "was_relations", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "was_relations", ["followed_id"], name: "index_was_relations_on_followed_id", using: :btree
  add_index "was_relations", ["follower_id", "followed_id"], name: "index_was_relations_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "was_relations", ["follower_id"], name: "index_was_relations_on_follower_id", using: :btree

end
