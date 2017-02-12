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

ActiveRecord::Schema.define(version: 20170212123719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_details", force: :cascade do |t|
    t.integer  "cart_id"
    t.integer  "catalog_id"
    t.integer  "qty"
    t.integer  "cost"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "approved",   default: false
  end

  add_index "cart_details", ["cart_id"], name: "index_cart_details_on_cart_id", using: :btree
  add_index "cart_details", ["catalog_id"], name: "index_cart_details_on_catalog_id", using: :btree

  create_table "carts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "cart_date"
    t.string   "status",      default: "pending"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "approved_at"
  end

  add_index "carts", ["user_id"], name: "index_carts_on_user_id", using: :btree

  create_table "catalogs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "points"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "categories_id"
  end

  add_index "catalogs", ["categories_id"], name: "index_catalogs_on_categories_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_periods", force: :cascade do |t|
    t.integer  "event_id"
    t.datetime "date_from"
    t.datetime "date_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "event_periods", ["event_id"], name: "index_event_periods_on_event_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "date_from"
    t.string   "date_to"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "event_range",      default: "monthly"
    t.integer  "range_max_points", default: 2
  end

  create_table "user_event_submissions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "date_processed"
    t.string   "attachment"
    t.string   "status"
    t.integer  "points",          default: 0
    t.string   "notes"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "event_period_id"
  end

  add_index "user_event_submissions", ["event_period_id"], name: "index_user_event_submissions_on_event_period_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "cart_details", "carts"
  add_foreign_key "cart_details", "catalogs"
  add_foreign_key "carts", "users"
  add_foreign_key "event_periods", "events"
  add_foreign_key "user_event_submissions", "event_periods"
end
