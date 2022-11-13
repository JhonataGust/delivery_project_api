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

ActiveRecord::Schema[7.0].define(version: 2022_11_13_164509) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "adminpack"
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.text "street"
    t.string "number"
    t.text "complement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "district"
    t.bigint "city_id"
    t.bigint "user_id"
    t.index ["city_id"], name: "index_addresses_on_city_id"
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "uf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state_name"
  end

  create_table "clients", force: :cascade do |t|
    t.string "company_name"
    t.string "short_name"
    t.float "company_relevance"
    t.bigint "user_id", null: false
    t.string "number"
    t.string "email"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "open"
    t.string "close"
    t.string "contact"
    t.boolean "completed", default: false
    t.string "uid"
    t.index ["uid"], name: "index_clients_on_uid"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "extras", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.float "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_extras_on_product_id"
  end

  create_table "order_relationships", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.integer "quantity"
    t.float "value"
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "extra_ids"
    t.integer "status", default: 0
    t.boolean "accepted"
    t.bigint "client_id"
    t.index ["client_id"], name: "index_order_relationships_on_client_id"
    t.index ["order_id"], name: "index_order_relationships_on_order_id"
    t.index ["product_id"], name: "index_order_relationships_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.boolean "accepted", default: false
    t.integer "payment_type"
    t.boolean "delivery"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.float "value"
    t.float "promotion"
    t.bigint "client_id", null: false
    t.datetime "duration_estimation", precision: nil
    t.boolean "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_type"
    t.index ["client_id"], name: "index_products_on_client_id"
  end

  create_table "user_carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.jsonb "extra_ids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_user_carts_on_product_id"
    t.index ["user_id"], name: "index_user_carts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "full_name"
    t.string "phone"
    t.integer "level_account"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "session_till"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "clients", "users"
  add_foreign_key "extras", "products"
  add_foreign_key "order_relationships", "orders"
  add_foreign_key "order_relationships", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "clients"
  add_foreign_key "user_carts", "products"
  add_foreign_key "user_carts", "users"
end
