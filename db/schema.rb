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

ActiveRecord::Schema.define(version: 20200502034237) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string   "person_type"
    t.integer  "person_id"
    t.integer  "city_id"
    t.string   "cep"
    t.string   "street"
    t.string   "complement"
    t.string   "neighborhood"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["city_id"], name: "index_addresses_on_city_id", using: :btree
    t.index ["person_type", "person_id"], name: "index_addresses_on_person_type_and_person_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "photo"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_clients_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_clients_on_reset_password_token", unique: true, using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.string   "buyer_type"
    t.integer  "buyer_id"
    t.string   "status"
    t.float    "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_type", "buyer_id"], name: "index_orders_on_buyer_type_and_buyer_id", using: :btree
  end

  create_table "product_orders", force: :cascade do |t|
    t.integer "product_id"
    t.integer "order_id"
    t.integer "quantity"
    t.index ["order_id"], name: "index_product_orders_on_order_id", using: :btree
    t.index ["product_id"], name: "index_product_orders_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "supplier_id"
    t.integer  "in_market"
    t.string   "name"
    t.float    "value"
    t.boolean  "in_stock"
    t.integer  "quantity"
    t.float    "comission",   default: 0.0
    t.string   "photo"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["supplier_id"], name: "index_products_on_supplier_id", using: :btree
  end

  create_table "suppliers", force: :cascade do |t|
    t.string   "cnpj"
    t.string   "phone"
    t.string   "company_name"
    t.string   "photo"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_suppliers_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_suppliers_on_reset_password_token", unique: true, using: :btree
  end

end
