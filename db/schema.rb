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

ActiveRecord::Schema.define(version: 20140423205431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fish", force: true do |t|
    t.string   "location"
    t.string   "species"
    t.string   "lenth"
    t.string   "weight"
    t.string   "bait"
    t.string   "depth"
    t.string   "temperature"
    t.string   "other_notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "fish", ["user_id"], name: "index_fish_on_user_id", using: :btree

  create_table "fish_types", force: true do |t|
    t.string "name"
    t.text   "description"
    t.string "image"
  end

  create_table "followings", force: true do |t|
    t.integer  "from_user_id"
    t.integer  "to_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.string   "location"
    t.string   "birth_year"
    t.string   "favorite_target"
    t.string   "best_catch"
    t.string   "short_bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string  "username"
    t.string  "password_digest"
    t.string  "email"
    t.boolean "was_email_verified"
    t.string  "email_verification_token"
  end

end
