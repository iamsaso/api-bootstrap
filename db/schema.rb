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

ActiveRecord::Schema.define(version: 20141112142502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.string   "token"
    t.text     "scope"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.integer  "client_id"
    t.integer  "refresh_token_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authorization_codes", force: :cascade do |t|
    t.string   "token"
    t.text     "scope"
    t.string   "redirect_uri"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "identifier"
    t.string   "secret"
    t.string   "name"
    t.string   "website"
    t.string   "redirect_uri"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refresh_tokens", force: :cascade do |t|
    t.string   "token"
    t.text     "scope"
    t.datetime "expires_at"
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scopes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "scope",      array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
