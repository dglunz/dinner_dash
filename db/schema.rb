# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141121163702) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "street_name"
    t.string   "street_number"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_items", id: false, force: true do |t|
    t.integer "category_id", null: false
    t.integer "item_id",     null: false
  end

  add_index "categories_items", ["category_id", "item_id"], name: "index_categories_items_on_category_id_and_item_id", using: :btree
  add_index "categories_items", ["item_id", "category_id"], name: "index_categories_items_on_item_id_and_category_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "items_orders", id: false, force: true do |t|
    t.integer "order_id", null: false
    t.integer "item_id",  null: false
  end

  add_index "items_orders", ["item_id", "order_id"], name: "index_items_orders_on_item_id_and_order_id", using: :btree
  add_index "items_orders", ["order_id", "item_id"], name: "index_items_orders_on_order_id_and_item_id", using: :btree

  create_table "orders", force: true do |t|
    t.boolean  "delivery"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "address_id"
    t.boolean  "pending"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "display_name"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
