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

ActiveRecord::Schema.define(version: 20150227041114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companions", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "is_owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companions_destinations", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "companion_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "companions_itineraries", force: :cascade do |t|
    t.integer  "companion_id"
    t.integer  "itinerary_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string   "location"
    t.string   "name"
    t.integer  "owner_id"
    t.date     "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "itineraries", force: :cascade do |t|
    t.string   "origin"
    t.string   "destination"
    t.string   "name"
    t.integer  "owner_id"
    t.date     "departure_date"
    t.date     "return_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.string   "reviewable_type"
    t.string   "reviewable_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
