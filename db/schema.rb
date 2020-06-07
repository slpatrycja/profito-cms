# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_07_095910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "client_global_services", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "global_service_id", null: false
    t.integer "price", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_global_services_on_client_id"
    t.index ["global_service_id"], name: "index_client_global_services_on_global_service_id"
  end

  create_table "client_logs", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.text "description", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_logs_on_client_id"
  end

  create_table "client_services", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "service_id", null: false
    t.bigint "office_id", null: false
    t.integer "price", null: false
    t.integer "year", null: false
    t.string "status", default: "new", null: false
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_client_services_on_client_id"
    t.index ["office_id"], name: "index_client_services_on_office_id"
    t.index ["service_id"], name: "index_client_services_on_service_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name", null: false
    t.string "surname", null: false
    t.string "email"
    t.string "pesel", null: false
    t.date "birth_date"
    t.string "telephone"
    t.string "country", default: "Polska", null: false
    t.string "voivodeship", null: false
    t.string "postal_name", null: false
    t.string "postal_code", null: false
    t.string "city"
    t.string "street"
    t.string "house_number"
    t.string "marital_status", default: "married", null: false
    t.date "wedding_date"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "idnr_de"
    t.string "idnr_nl"
    t.string "idnr_be"
    t.string "idnr_at"
    t.string "steuernummer"
    t.boolean "problematic", default: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "global_services", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offices", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_offices_on_country_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.integer "value", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_payments_on_client_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name", null: false
    t.integer "price", null: false
    t.string "service_type", default: "tax", null: false
    t.bigint "country_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_services_on_country_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "client_service_id", null: false
    t.date "date", null: false
    t.integer "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_service_id"], name: "index_shipments_on_client_service_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.string "initials"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "client_global_services", "clients"
  add_foreign_key "client_global_services", "global_services"
  add_foreign_key "client_logs", "clients"
  add_foreign_key "client_services", "clients"
  add_foreign_key "client_services", "offices"
  add_foreign_key "client_services", "services"
  add_foreign_key "offices", "countries"
  add_foreign_key "payments", "clients"
  add_foreign_key "services", "countries"
  add_foreign_key "shipments", "client_services"
end
