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

ActiveRecord::Schema[7.0].define(version: 2022_12_14_133107) do
  create_table "api_v1_accommodation_facilities", force: :cascade do |t|
    t.decimal "total_price"
    t.decimal "net_price"
    t.decimal "iron"
    t.decimal "mini_bar"
    t.decimal "air_conditioner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_accommodation_facilities_accommodations", id: false, force: :cascade do |t|
    t.integer "api_v1_accommodation_id", null: false
    t.integer "api_v1_accommodation_facility_id", null: false
  end

  create_table "api_v1_accommodations", force: :cascade do |t|
    t.integer "type_of_hotel"
    t.string "country"
    t.string "city"
    t.string "street"
    t.string "phone_number"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "api_v1_rentals", force: :cascade do |t|
    t.integer "status"
    t.date "reserve_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "api_v1_accommodation_id", null: false
    t.integer "user_id", null: false
    t.decimal "total_price", precision: 8, scale: 2
    t.index ["api_v1_accommodation_id"], name: "index_api_v1_rentals_on_api_v1_accommodation_id"
    t.index ["user_id"], name: "index_api_v1_rentals_on_user_id"
  end

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp", null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "api_v1_rentals", "api_v1_accommodations"
  add_foreign_key "api_v1_rentals", "users"
end
