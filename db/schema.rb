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

ActiveRecord::Schema.define(version: 20160303085406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.text     "details",                              null: false
    t.date     "start_at"
    t.date     "end_at"
    t.string   "activity_image01_url",                 null: false
    t.string   "activity_image02_url",                 null: false
    t.string   "activity_image03_url",                 null: false
    t.string   "youtube_url",                          null: false
    t.integer  "capacity"
    t.boolean  "booking_status",       default: false
    t.text     "rules"
    t.text     "apply_details"
    t.integer  "payment_price"
    t.boolean  "payment_need",         default: false
    t.boolean  "avaliable",            default: true
    t.float    "rating",               default: 0.0
    t.integer  "admin_user_id"
    t.integer  "temple_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "permanent"
  end

  add_index "activities", ["admin_user_id", "created_at"], name: "index_activities_on_admin_user_id_and_created_at", using: :btree
  add_index "activities", ["admin_user_id"], name: "index_activities_on_admin_user_id", using: :btree
  add_index "activities", ["id"], name: "index_activities_on_id", unique: true, using: :btree
  add_index "activities", ["name"], name: "index_activities_on_name", unique: true, using: :btree
  add_index "activities", ["temple_id", "created_at"], name: "index_activities_on_temple_id_and_created_at", using: :btree
  add_index "activities", ["temple_id"], name: "index_activities_on_temple_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.float    "balance",         default: 0.0
    t.boolean  "admin",           default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "profile_image"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree

  create_table "bank_accounts", force: :cascade do |t|
    t.string   "name",               null: false
    t.string   "number",             null: false
    t.integer  "admin_user_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "owner_account_name"
    t.string   "bank_name"
  end

  add_index "bank_accounts", ["admin_user_id"], name: "index_bank_accounts_on_admin_user_id", using: :btree
  add_index "bank_accounts", ["id"], name: "index_bank_accounts_on_id", unique: true, using: :btree

  create_table "reservations", force: :cascade do |t|
    t.datetime "payment_made",               null: false
    t.float    "payment_amount",             null: false
    t.integer  "activity_id"
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "quantity",       default: 0
    t.string   "firstname",                  null: false
    t.string   "lastname",                   null: false
    t.string   "email",                      null: false
    t.string   "phone_number"
  end

  add_index "reservations", ["activity_id"], name: "index_reservations_on_activity_id", using: :btree
  add_index "reservations", ["email"], name: "index_reservations_on_email", unique: true, using: :btree
  add_index "reservations", ["id"], name: "index_reservations_on_id", unique: true, using: :btree
  add_index "reservations", ["user_id"], name: "index_reservations_on_user_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.text     "comment",     null: false
    t.integer  "score",       null: false
    t.integer  "user_id"
    t.integer  "activity_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["activity_id"], name: "index_reviews_on_activity_id", using: :btree
  add_index "reviews", ["id"], name: "index_reviews_on_id", unique: true, using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "temples", force: :cascade do |t|
    t.string   "name",           null: false
    t.string   "logo_url"
    t.string   "slogan"
    t.text     "address",        null: false
    t.string   "map_image_url"
    t.string   "phone_number",   null: false
    t.string   "email",          null: false
    t.string   "website"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "temple_image01", null: false
    t.string   "temple_image02", null: false
    t.string   "temple_image03", null: false
    t.string   "temple_image04"
    t.string   "temple_image05"
    t.string   "temple_image06"
    t.string   "facebook_url"
    t.string   "country"
    t.string   "city"
    t.integer  "admin_user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "country_code"
  end

  add_index "temples", ["admin_user_id", "created_at"], name: "index_temples_on_admin_user_id_and_created_at", using: :btree
  add_index "temples", ["admin_user_id"], name: "index_temples_on_admin_user_id", using: :btree
  add_index "temples", ["city"], name: "index_temples_on_city", using: :btree
  add_index "temples", ["id"], name: "index_temples_on_id", unique: true, using: :btree
  add_index "temples", ["name"], name: "index_temples_on_name", unique: true, using: :btree

  create_table "users", id: :bigserial, force: :cascade do |t|
    t.string   "username"
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.float    "balance",           default: 0.0
    t.boolean  "admin",             default: false
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "phone_number"
    t.string   "birth_date"
    t.string   "address"
    t.string   "city"
    t.string   "zip_code"
    t.string   "country"
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "login_type"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
