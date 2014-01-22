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

ActiveRecord::Schema.define(version: 20131209143629) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_users", id: false, force: true do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_users", ["user_id", "category_id"], name: "index_categories_users_on_user_id_and_category_id"

  create_table "communities", force: true do |t|
    t.string   "contry"
    t.string   "city"
    t.string   "description"
    t.string   "web"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
    t.string   "name"
  end

  create_table "communities_users", id: false, force: true do |t|
    t.integer "community_id"
    t.integer "user_id"
  end

  add_index "communities_users", ["user_id", "community_id"], name: "index_communities_users_on_user_id_and_community_id"

  create_table "meetings", force: true do |t|
    t.time     "date_star"
    t.string   "city"
    t.string   "contry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "community_id"
    t.string   "name"
    t.integer  "place_id"
  end

  create_table "meetings_users", id: false, force: true do |t|
    t.integer "meeting_id"
    t.integer "user_id"
  end

  add_index "meetings_users", ["user_id", "meeting_id"], name: "index_meetings_users_on_user_id_and_meeting_id"

  create_table "places", force: true do |t|
    t.string   "name"
    t.string   "addres"
    t.string   "city"
    t.string   "contry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: true do |t|
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
    t.string   "name"
    t.string   "identity"
    t.string   "contry"
    t.string   "city"
    t.string   "language"
    t.string   "genre"
    t.string   "bio"
    t.date     "birthday"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
