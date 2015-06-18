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

ActiveRecord::Schema.define(version: 20150618071011) do

  create_table "activities", force: :cascade do |t|
    t.integer  "action"
    t.string   "object"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.string   "abb"
    t.integer  "team_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "leader_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_positions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "position_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_positions", ["position_id"], name: "index_user_positions_on_position_id"
  add_index "user_positions", ["user_id"], name: "index_user_positions_on_user_id"

  create_table "user_projects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",       null: false
    t.string   "email",                  default: "",       null: false
    t.datetime "birthday",                                  null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "role",                   default: "normal", null: false
    t.integer  "team_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,        null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,        null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "language"
    t.string   "string"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "userskills", force: :cascade do |t|
    t.integer  "level"
    t.integer  "year"
    t.integer  "user_id"
    t.integer  "skill_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "userskills", ["skill_id"], name: "index_userskills_on_skill_id"
  add_index "userskills", ["user_id"], name: "index_userskills_on_user_id"

end
