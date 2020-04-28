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

ActiveRecord::Schema.define(version: 2020_04_28_073100) do

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.text "address"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.string "mobile_number"
  end

  create_table "issues", force: :cascade do |t|
    t.string "issue_type"
    t.string "title"
    t.text "description"
    t.integer "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "status"
    t.index ["customer_id", "created_at"], name: "index_issues_on_customer_id_and_created_at"
    t.index ["customer_id"], name: "index_issues_on_customer_id"
  end

  add_foreign_key "issues", "customers"
end
