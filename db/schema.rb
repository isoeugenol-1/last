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

ActiveRecord::Schema.define(version: 20190210034107) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "address"
    t.string "postcode"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "home_id"
    t.index ["home_id"], name: "index_addresses_on_home_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.text "home"
    t.decimal "sikikinn"
    t.decimal "reikinn"
    t.decimal "space"
    t.text "area"
    t.decimal "price"
    t.text "ldk"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.json "image"
    t.index ["user_id"], name: "index_homes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.text "image"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "homes"
  add_foreign_key "homes", "users"
end
