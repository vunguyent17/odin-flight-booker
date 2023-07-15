# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_07_13_150535) do
  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "note"
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "route_id", null: false
    t.datetime "departure_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_flights_on_route_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.integer "booking_id", null: false
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  create_table "routes", force: :cascade do |t|
    t.integer "airport_from_id", null: false
    t.integer "airport_to_id", null: false
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["airport_from_id"], name: "index_routes_on_airport_from_id"
    t.index ["airport_to_id"], name: "index_routes_on_airport_to_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", default: "", null: false
    t.string "fullname", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "flights"
  add_foreign_key "bookings", "users"
  add_foreign_key "flights", "routes"
  add_foreign_key "passengers", "bookings"
  add_foreign_key "routes", "airports", column: "airport_from_id"
  add_foreign_key "routes", "airports", column: "airport_to_id"
end
