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

ActiveRecord::Schema.define(version: 20191028083824) do

  create_table "birth_years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535, null: false
    t.integer  "item_id"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["item_id"], name: "index_comments_on_item_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "credit_cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",     null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_credit_cards_on_user_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",      null: false
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                  null: false
    t.text     "description",             limit: 65535, null: false
    t.integer  "condition_id"
    t.integer  "shipping_fee_id"
    t.integer  "shipping_form_id"
    t.integer  "prefecture_id"
    t.integer  "days_before_shipping_id"
    t.integer  "size_id"
    t.string   "brand"
    t.string   "category"
    t.integer  "price"
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "shipping_address_id"
    t.string   "status"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["seller_id"], name: "index_items_on_seller_id", using: :btree
    t.index ["shipping_address_id"], name: "index_items_on_shipping_address_id", using: :btree
  end

  create_table "shipping_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "shipping_last_name",       null: false
    t.string   "shipping_first_name",      null: false
    t.string   "shipping_last_name_kana",  null: false
    t.string   "shipping_first_name_kana", null: false
    t.string   "postal_code",              null: false
    t.integer  "prefecture_id",            null: false
    t.string   "city",                     null: false
    t.string   "house_number",             null: false
    t.string   "building"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_shipping_addresses_on_user_id", using: :btree
  end

  create_table "sign_ups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "uid",                      null: false
    t.string   "provider",                 null: false
    t.text     "token",      limit: 65535
    t.integer  "user_id",                  null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "user_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "postal_code"
    t.integer  "prefecture"
    t.string   "city"
    t.string   "house_number"
    t.string   "building"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_user_addresses_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "nickname",                            null: false
    t.string   "last_name",                           null: false
    t.string   "first_name",                          null: false
    t.string   "last_name_kana",                      null: false
    t.string   "first_name_kana",                     null: false
    t.integer  "birth_year_id",                       null: false
    t.integer  "birth_month",                         null: false
    t.integer  "birth_day",                           null: false
    t.string   "phone",                               null: false
    t.string   "image"
    t.string   "profile"
    t.integer  "sales_amount"
    t.integer  "points"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "comments", "items"
  add_foreign_key "comments", "users"
  add_foreign_key "credit_cards", "users"
  add_foreign_key "images", "items"
  add_foreign_key "shipping_addresses", "users"
  add_foreign_key "sns_credentials", "users"
  add_foreign_key "user_addresses", "users"
end
