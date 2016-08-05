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

ActiveRecord::Schema.define(version: 20160803155255) do

  create_table "lines", force: true do |t|
    t.integer  "story_id"
    t.string   "line"
    t.boolean  "is_f"
    t.integer  "report"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lines", ["story_id"], name: "index_lines_on_story_id"

  create_table "prompt_actions", force: true do |t|
    t.string   "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prompt_locations", force: true do |t|
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "prompt_names", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stories", force: true do |t|
    t.boolean  "start_f"
    t.integer  "max"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
