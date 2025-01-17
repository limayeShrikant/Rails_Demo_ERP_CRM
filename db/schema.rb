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

ActiveRecord::Schema.define(version: 20250117071043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address_type"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.text "address_detail"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "pincode"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leads", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "company"
    t.string "phone"
    t.string "city"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sales_proposals", force: :cascade do |t|
    t.bigint "lead_id"
    t.string "lead_name", null: false
    t.string "status"
    t.string "state"
    t.string "architect_name"
    t.string "architect_contact"
    t.string "source"
    t.boolean "won"
    t.boolean "lost"
    t.string "quotation_reference"
    t.date "quotation_date"
    t.decimal "won_qty", precision: 15, scale: 4
    t.string "won_unit"
    t.text "lost_against_information"
    t.decimal "alternate_product_rate", precision: 19, scale: 4
    t.date "won_date"
    t.string "product"
    t.datetime "last_opened_on"
    t.boolean "locked", default: false
    t.datetime "locked_on"
    t.bigint "project_execution_id"
    t.bigint "created_by_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_by_id"], name: "index_sales_proposals_on_created_by_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "city", default: ""
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "employee"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "sales_proposals", "users", column: "created_by_id"
end
