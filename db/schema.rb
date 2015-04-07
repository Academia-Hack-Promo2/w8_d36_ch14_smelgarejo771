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

ActiveRecord::Schema.define(version: 20150406193254) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "client_id",  limit: 4,                 null: false
    t.string   "number",     limit: 20,                null: false
    t.integer  "type",       limit: 4,                 null: false
    t.decimal  "balance",               precision: 10, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "accounts", ["client_id"], name: "index_accounts_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "first_name",  limit: 20,    null: false
    t.string   "last_name",   limit: 20,    null: false
    t.integer  "credential",  limit: 4,     null: false
    t.text     "addres",      limit: 65535, null: false
    t.string   "local_phone", limit: 11,    null: false
    t.string   "movil_phone", limit: 11
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "operations", force: :cascade do |t|
    t.integer  "account_id",  limit: 4,                 null: false
    t.string   "type",        limit: 20,                null: false
    t.string   "origin_acc",  limit: 20,                null: false
    t.string   "destiny_acc", limit: 20,                null: false
    t.decimal  "amount",                 precision: 10, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "operations", ["account_id"], name: "index_operations_on_account_id", using: :btree

  add_foreign_key "accounts", "clients"
  add_foreign_key "operations", "accounts"
end
