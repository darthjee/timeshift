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

ActiveRecord::Schema.define(version: 20150525143408) do

  create_table "time_sheet_days", force: true do |t|
    t.string   "observation"
    t.date     "date",                    null: false
    t.integer  "expected",    default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "month_id"
  end

  create_table "time_sheet_entries", force: true do |t|
    t.integer "day_id", null: false
    t.time    "time",   null: false
    t.string  "flow",   null: false
  end

  create_table "time_sheet_months", force: true do |t|
    t.integer  "year"
    t.integer  "month"
    t.integer  "sheet_id",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "time_sheet_sheets", force: true do |t|
    t.integer  "user_id",    null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
