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

ActiveRecord::Schema.define(version: 20180306143002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "quote_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.boolean "paid", default: false
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.index ["quote_id"], name: "index_bookings_on_quote_id"
  end

  create_table "buildings", force: :cascade do |t|
    t.integer "access_count"
    t.string "object_type"
    t.string "vds_certification"
    t.string "security_hull"
    t.string "emergency_response"
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vds_multiple"
    t.index ["request_id"], name: "index_buildings_on_request_id"
  end

  create_table "floors", force: :cascade do |t|
    t.string "floor_type"
    t.integer "windows"
    t.integer "rooms"
    t.integer "doors"
    t.bigint "building_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "motion_detector_min"
    t.integer "motion_detector_max"
    t.integer "windows_and_doors_sensor"
    t.index ["building_id"], name: "index_floors_on_building_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "supplier_name"
    t.string "supplier_address"
    t.string "phone_number"
    t.string "token"
    t.integer "price_cents", default: 0, null: false
    t.index ["request_id"], name: "index_quotes_on_request_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "zip_code"
    t.integer "price_min"
    t.integer "price_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "gender"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id"
    t.index ["request_id"], name: "index_users_on_request_id"
  end

  add_foreign_key "bookings", "quotes"
  add_foreign_key "buildings", "requests"
  add_foreign_key "floors", "buildings"
  add_foreign_key "quotes", "requests"
  add_foreign_key "users", "requests"
end
