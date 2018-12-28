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

ActiveRecord::Schema.define(version: 2018_12_28_185220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.boolean "approved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clearances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_clearances_on_agency_id"
    t.index ["user_id"], name: "index_clearances_on_user_id"
  end

  create_table "disciplines", force: :cascade do |t|
    t.string "name"
    t.string "field"
    t.string "job_title"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "sex"
    t.date "date_of_birth"
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_patients_on_agency_id"
  end

  create_table "rates", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "visit_type_id"
    t.bigint "agency_id"
    t.float "amount"
    t.integer "arrangement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_rates_on_agency_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
    t.index ["visit_type_id"], name: "index_rates_on_visit_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "visit_types", force: :cascade do |t|
    t.string "name"
    t.integer "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "agency_id"
    t.bigint "user_id"
    t.bigint "visit_type_id"
    t.datetime "time_in"
    t.datetime "time_out"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_visits_on_agency_id"
    t.index ["patient_id"], name: "index_visits_on_patient_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
    t.index ["visit_type_id"], name: "index_visits_on_visit_type_id"
  end

  add_foreign_key "clearances", "agencies"
  add_foreign_key "clearances", "users"
  add_foreign_key "patients", "agencies"
  add_foreign_key "rates", "agencies"
  add_foreign_key "rates", "users"
  add_foreign_key "rates", "visit_types"
  add_foreign_key "visits", "agencies"
  add_foreign_key "visits", "patients"
  add_foreign_key "visits", "users"
  add_foreign_key "visits", "visit_types"
end
