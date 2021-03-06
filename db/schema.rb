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

ActiveRecord::Schema.define(version: 20161123060211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "room_statuses", force: :cascade do |t|
    t.datetime "created_at",            null: false
    t.integer  "total_user_count"
    t.integer  "registered_user_count"
    t.boolean  "joinable"
    t.integer  "room_id"
    t.datetime "updated_at",            null: false
    t.index ["room_id"], name: "index_room_statuses_on_room_id", using: :btree
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.string   "room_id"
    t.boolean  "premium_only"
    t.string   "owner"
    t.string   "language"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_foreign_key "room_statuses", "rooms"
end
