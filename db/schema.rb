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

ActiveRecord::Schema.define(version: 20160420163329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "growers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "mobile"
    t.string   "vat"
    t.string   "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "project_id"
  end

  add_index "growers", ["project_id"], name: "index_growers_on_project_id", using: :btree

  create_table "loadings", force: :cascade do |t|
    t.date     "date"
    t.string   "customer"
    t.string   "destination"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lots", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "lot"
    t.integer  "purchase_id"
  end

  create_table "members", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "members", ["tenant_id"], name: "index_members_on_tenant_id", using: :btree
  add_index "members", ["user_id"], name: "index_members_on_user_id", using: :btree

  create_table "palet_line_items", force: :cascade do |t|
    t.integer  "lot_id"
    t.integer  "palet_id"
    t.integer  "cartons"
    t.string   "packing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "palet_line_items", ["lot_id"], name: "index_palet_line_items_on_lot_id", using: :btree
  add_index "palet_line_items", ["palet_id"], name: "index_palet_line_items_on_palet_id", using: :btree

  create_table "palets", force: :cascade do |t|
    t.date     "date"
    t.integer  "loading_id"
    t.string   "code"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paralavis", force: :cascade do |t|
    t.integer  "kivotia"
    t.integer  "kgs"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "purchase_id"
    t.integer  "lot_id"
  end

  create_table "pmus", force: :cascade do |t|
    t.string   "produce"
    t.string   "nearest_village"
    t.string   "area_name"
    t.integer  "sq_area"
    t.integer  "plants"
    t.string   "usual_production"
    t.string   "facilities"
    t.string   "certification"
    t.integer  "grower_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "pmus", ["grower_id"], name: "index_pmus_on_grower_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.string   "details"
    t.date     "expected_completion_date"
    t.integer  "tenant_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "projects", ["tenant_id"], name: "index_projects_on_tenant_id", using: :btree

  create_table "purchases", force: :cascade do |t|
    t.date     "date"
    t.integer  "pmu_id"
    t.float    "price"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "tenants", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "plan"
  end

  add_index "tenants", ["name"], name: "index_tenants_on_name", using: :btree
  add_index "tenants", ["tenant_id"], name: "index_tenants_on_tenant_id", using: :btree

  create_table "tenants_users", id: false, force: :cascade do |t|
    t.integer "tenant_id", null: false
    t.integer "user_id",   null: false
  end

  add_index "tenants_users", ["tenant_id", "user_id"], name: "index_tenants_users_on_tenant_id_and_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                        default: "",    null: false
    t.string   "encrypted_password",           default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "skip_confirm_change_password", default: false
    t.integer  "tenant_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "members", "tenants"
  add_foreign_key "members", "users"
  add_foreign_key "palet_line_items", "lots"
  add_foreign_key "palet_line_items", "palets"
  add_foreign_key "projects", "tenants"
  add_foreign_key "tenants", "tenants"
end
