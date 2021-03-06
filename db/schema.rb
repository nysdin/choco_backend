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

ActiveRecord::Schema.define(version: 2021_12_28_075823) do

  create_table "departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_departments_on_name", unique: true
  end

  create_table "divided_departments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "department_id", null: false
    t.bigint "merchandise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_divided_departments_on_department_id"
    t.index ["merchandise_id"], name: "index_divided_departments_on_merchandise_id"
  end

  create_table "favorites", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "merchandise_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchandise_id"], name: "index_favorites_on_merchandise_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "merchandise_images", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "url", null: false
    t.bigint "merchandise_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["merchandise_id"], name: "index_merchandise_images_on_merchandise_id"
  end

  create_table "merchandises", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "price", null: false
    t.bigint "seller_id"
    t.bigint "buyer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image"
    t.integer "public_status", null: false
    t.integer "condition", null: false
    t.index ["buyer_id"], name: "fk_rails_01d2795006"
    t.index ["seller_id"], name: "fk_rails_63736ada83"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "nick_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "image"
    t.integer "evaluation", default: 5, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "divided_departments", "departments"
  add_foreign_key "divided_departments", "merchandises"
  add_foreign_key "favorites", "merchandises"
  add_foreign_key "favorites", "users"
  add_foreign_key "merchandise_images", "merchandises"
  add_foreign_key "merchandises", "users", column: "buyer_id"
  add_foreign_key "merchandises", "users", column: "seller_id"
end
