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

ActiveRecord::Schema.define(version: 2022_03_21_022621) do

  create_table "batches", force: :cascade do |t|
    t.integer "producer_id", null: false
    t.integer "store_id"
    t.string "item_name"
    t.datetime "best_by", precision: 6
    t.datetime "exp_date", precision: 6
    t.boolean "recall", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["producer_id"], name: "index_batches_on_producer_id"
    t.index ["store_id"], name: "index_batches_on_store_id"
  end

  create_table "food_item_statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pantry_id"
    t.integer "batch_id"
    t.integer "order_id"
    t.integer "food_item_status_id"
    t.time "deleted_at"
    t.index ["batch_id"], name: "index_food_items_on_batch_id"
    t.index ["food_item_status_id"], name: "index_food_items_on_food_item_status_id"
    t.index ["order_id"], name: "index_food_items_on_order_id"
    t.index ["pantry_id"], name: "index_food_items_on_pantry_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.boolean "transferred", default: false, null: false
    t.index ["store_id"], name: "index_orders_on_store_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pantries", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
  end

  create_table "producers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.integer "role", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "pantry_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["pantry_id"], name: "index_users_on_pantry_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batches", "producers"
  add_foreign_key "batches", "stores"
  add_foreign_key "food_items", "batches"
  add_foreign_key "food_items", "orders"
  add_foreign_key "orders", "stores"
end
