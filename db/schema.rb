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

ActiveRecord::Schema.define(version: 2019_01_17_031823) do

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

  create_table "agency_rates", force: :cascade do |t|
    t.bigint "agency_id"
    t.bigint "visit_type_id"
    t.float "amount"
    t.integer "arrangement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_agency_rates_on_agency_id"
    t.index ["visit_type_id"], name: "index_agency_rates_on_visit_type_id"
  end

  create_table "clearances", force: :cascade do |t|
    t.bigint "agency_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["agency_id"], name: "index_clearances_on_agency_id"
    t.index ["user_id"], name: "index_clearances_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "agency_id"
    t.date "effective_date"
    t.date "termination_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agency_id"], name: "index_contracts_on_agency_id"
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
    t.bigint "visit_type_id"
    t.bigint "agency_id"
    t.float "amount"
    t.integer "arrangement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["agency_id"], name: "index_rates_on_agency_id"
    t.index ["user_id"], name: "index_rates_on_user_id"
    t.index ["visit_type_id"], name: "index_rates_on_visit_type_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discipline_id"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zip_code"
    t.string "email"
    t.string "auth0_id_string"
    t.index ["auth0_id_string"], name: "index_users_on_auth0_id_string", unique: true
    t.index ["discipline_id"], name: "index_users_on_discipline_id"
    t.index ["email"], name: "index_users_on_email", unique: true
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
    t.bigint "visit_type_id"
    t.datetime "time_in"
    t.datetime "time_out"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.datetime "date"
    t.index ["agency_id"], name: "index_visits_on_agency_id"
    t.index ["patient_id"], name: "index_visits_on_patient_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
    t.index ["visit_type_id"], name: "index_visits_on_visit_type_id"
  end

  add_foreign_key "agency_rates", "agencies"
  add_foreign_key "agency_rates", "visit_types"
  add_foreign_key "clearances", "agencies"
  add_foreign_key "clearances", "users"
  add_foreign_key "contracts", "agencies"
  add_foreign_key "patients", "agencies"
  add_foreign_key "rates", "agencies"
  add_foreign_key "rates", "users"
  add_foreign_key "rates", "visit_types"
  add_foreign_key "users", "disciplines"
  add_foreign_key "visits", "agencies"
  add_foreign_key "visits", "patients"
  add_foreign_key "visits", "users"
  add_foreign_key "visits", "visit_types"
end
