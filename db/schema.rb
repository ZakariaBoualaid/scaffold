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

ActiveRecord::Schema.define(version: 20140707042357) do

  create_table "courses", force: true do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.integer  "unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["unit_id"], name: "index_courses_on_unit_id"

  create_table "exercices", force: true do |t|
    t.string   "name"
    t.integer  "lesson_id"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "exercices", ["lesson_id"], name: "index_exercices_on_lesson_id"

  create_table "exercices_users", force: true do |t|
    t.integer "exercice_id"
    t.integer "user_id"
  end

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lessons", ["course_id"], name: "index_lessons_on_course_id"

  create_table "mods", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", force: true do |t|
    t.string  "name"
    t.string  "slug"
    t.integer "mod_id"
  end

  add_index "units", ["mod_id"], name: "index_units_on_mod_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token_authenticatable"
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
