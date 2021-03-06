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

ActiveRecord::Schema.define(version: 20171019044627) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string  "city",       limit: 50
    t.integer "zip"
    t.string  "phone",      limit: 15
    t.integer "user_id"
    t.string  "address",    limit: 50
    t.integer "country_id"
    t.string  "first_name"
    t.string  "last_name"
    t.index ["country_id"], name: "index_addresses_on_country_id", using: :btree
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "authors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "author_id"
    t.integer "book_id"
    t.index ["author_id"], name: "index_authors_books_on_author_id", using: :btree
    t.index ["book_id"], name: "index_authors_books_on_book_id", using: :btree
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.float    "price"
    t.integer  "quantity"
    t.string   "photos"
    t.text     "description"
    t.integer  "year_publication"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "dimension_id"
    t.index ["dimension_id"], name: "index_books_on_dimension_id", using: :btree
  end

  create_table "books_categories", id: false, force: :cascade do |t|
    t.integer "book_id"
    t.integer "category_id"
    t.index ["book_id"], name: "index_books_categories_on_book_id", using: :btree
    t.index ["category_id"], name: "index_books_categories_on_category_id", using: :btree
  end

  create_table "books_materials", id: false, force: :cascade do |t|
    t.integer "book_id"
    t.integer "material_id"
    t.index ["book_id"], name: "index_books_materials_on_book_id", using: :btree
    t.index ["material_id"], name: "index_books_materials_on_material_id", using: :btree
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "secret_code"
    t.integer  "used_count"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.float    "discount"
    t.boolean  "active",      default: true
  end

  create_table "credit_cards", force: :cascade do |t|
    t.string   "card_name"
    t.string   "card_number"
    t.integer  "mount"
    t.integer  "year"
    t.string   "cvv"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.decimal  "price",      precision: 7, scale: 2
    t.string   "name"
    t.integer  "min_day"
    t.integer  "max_day"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "dimensions", force: :cascade do |t|
    t.float    "H"
    t.float    "W"
    t.float    "D"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "order_id"
    t.integer  "quantity",                            default: 1
    t.decimal  "unit_price",  precision: 5, scale: 2
    t.decimal  "total_price", precision: 7, scale: 2
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.index ["book_id"], name: "index_order_items_on_book_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "sub_total",        precision: 7, scale: 2
    t.decimal  "order_total",      precision: 7, scale: 2
    t.string   "state",                                    default: "waiting_processing"
    t.datetime "created_at",                                                              null: false
    t.datetime "updated_at",                                                              null: false
    t.decimal  "discount",         precision: 4, scale: 2, default: "0.0"
    t.integer  "delivery_id"
    t.integer  "credit_card_id"
    t.string   "confirm_token"
    t.boolean  "status_confirmed",                         default: false
    t.index ["credit_card_id"], name: "index_orders_on_credit_card_id", using: :btree
    t.index ["delivery_id"], name: "index_orders_on_delivery_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "images"
    t.string   "imageable_type"
    t.integer  "imageable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["imageable_type", "imageable_id"], name: "index_pictures_on_imageable_type_and_imageable_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "rating",      default: 1
    t.integer  "book_id"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "state",       default: "in_draft"
    t.index ["book_id"], name: "index_reviews_on_book_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                             default: ""
    t.string   "encrypted_password",                default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "admin"
    t.string   "first_name",             limit: 50
    t.string   "last_name",              limit: 50
    t.string   "provider"
    t.string   "uid"
    t.text     "image"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "authors_books", "authors"
  add_foreign_key "authors_books", "books"
  add_foreign_key "books_categories", "books"
  add_foreign_key "books_categories", "categories"
  add_foreign_key "books_materials", "books"
  add_foreign_key "books_materials", "materials"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
end
