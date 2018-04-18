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

ActiveRecord::Schema.define(version: 2018_04_18_004656) do

  create_table "calendars", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.float "month_distance"
    t.string "goal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "runs", force: :cascade do |t|
    t.date "date"
    t.string "name"
    t.float "distance"
    t.integer "duration"
    t.integer "pace_per_mile"
    t.text "notes"
    t.integer "number_intervals"
    t.integer "interval_length"
    t.integer "rest_between_interval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
