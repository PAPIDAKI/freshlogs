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

ActiveRecord::Schema.define(version: 20160730214936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agreement_infos", force: :cascade do |t|
    t.string   "price"
    t.string   "unit"
    t.string   "note"
    t.integer  "agreementable_id"
    t.string   "agreement_type"
    t.integer  "worker_id"
    t.integer  "company_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "agreement_infos", ["agreementable_id"], name: "index_agreement_infos_on_agreementable_id", using: :btree

  create_table "artifacts", force: :cascade do |t|
    t.string   "name"
    t.string   "key"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "artifacts", ["project_id"], name: "index_artifacts_on_project_id", using: :btree

  create_table "att_performances", force: :cascade do |t|
    t.integer  "attendance_id"
    t.integer  "tenant_id"
    t.string   "work_position"
    t.integer  "cartons_packed"
    t.datetime "late_arrival"
    t.datetime "early_leave"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "attendances", force: :cascade do |t|
    t.integer  "shift_list_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "worker_id"
  end

  add_index "attendances", ["shift_list_id"], name: "index_attendances_on_shift_list_id", using: :btree

  create_table "companies", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string   "address"
    t.string   "telephone"
    t.string   "mobile"
    t.string   "email"
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "worker_id"
    t.integer  "company_id"
  end

  add_index "contact_infos", ["contactable_type", "contactable_id"], name: "index_contact_infos_on_contactable_type_and_contactable_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.integer  "tenant_id"
  end

  add_index "growers", ["project_id"], name: "index_growers_on_project_id", using: :btree

  create_table "loadings", force: :cascade do |t|
    t.datetime "date"
    t.string   "customer"
    t.date     "eta"
    t.boolean  "delivered"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "tenant_id"
  end

  create_table "loose_berries", force: :cascade do |t|
    t.integer  "purchase_id"
    t.integer  "tenant_id"
    t.float    "kg"
    t.string   "note"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "date"
  end

  create_table "lots", force: :cascade do |t|
    t.integer  "purchase_id"
    t.string   "lot"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "tenant_id"
    t.integer  "kg",          default: 0
    t.string   "plastics"
    t.string   "note"
  end

  add_index "lots", ["purchase_id"], name: "index_lots_on_purchase_id", using: :btree

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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "palet_id"
    t.integer  "lot_id"
    t.integer  "cartons"
    t.integer  "tenant_id"
  end

  create_table "palets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.string   "code"
    t.integer  "loading_id"
    t.integer  "tenant_id"
    t.string   "note"
    t.string   "packed_for"
  end

  create_table "paralavis", force: :cascade do |t|
    t.integer  "lot_id"
    t.integer  "plastics"
    t.integer  "kgs"
    t.string   "note"
    t.integer  "tenant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pmus", force: :cascade do |t|
    t.string   "produce"
    t.string   "village"
    t.string   "location"
    t.integer  "size"
    t.integer  "plants"
    t.integer  "production"
    t.string   "facilities"
    t.string   "certification"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "grower_id"
    t.integer  "tenant_id"
  end

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
    t.float    "price"
    t.string   "note"
    t.integer  "tenant_id"
    t.integer  "pmu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date     "date"
  end

  create_table "purs", force: :cascade do |t|
    t.float    "price"
    t.string   "unit"
    t.string   "note"
    t.integer  "pmu_id"
    t.integer  "tenant_id"
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

  create_table "shift_lists", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "tenant_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tenant_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "workers", force: :cascade do |t|
    t.string   "last_name"
    t.string   "mobile"
    t.integer  "tenant_id"
    t.integer  "course_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "first_name"
    t.string   "phone"
    t.string   "insurance"
    t.boolean  "active"
    t.integer  "age"
    t.string   "area"
    t.string   "working_experience"
    t.integer  "w_id"
  end

  add_foreign_key "artifacts", "projects"
  add_foreign_key "attendances", "shift_lists"
  add_foreign_key "members", "tenants"
  add_foreign_key "members", "users"
  add_foreign_key "projects", "tenants"
  add_foreign_key "tenants", "tenants"
end
