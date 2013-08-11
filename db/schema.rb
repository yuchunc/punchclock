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

ActiveRecord::Schema.define(version: 20130811142301) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "city"
    t.string   "district"
    t.string   "address"
    t.string   "phone"
    t.string   "postal_code"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.string   "name",           null: false
    t.integer  "pay_per_hour"
    t.integer  "hours_per_week"
    t.boolean  "ongoing"
    t.boolean  "deleted"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "punchcards", force: true do |t|
    t.datetime "punchin"
    t.datetime "punchout"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
