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

ActiveRecord::Schema.define(version: 20141125032653) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "characters", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position_x"
    t.integer  "position_y"
  end

  add_index "characters", ["name"], name: "index_characters_on_name", unique: true, using: :btree

  create_table "games", force: true do |t|
    t.integer  "score"
    t.string   "player_name"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: true do |t|
    t.integer  "character_id", null: false
    t.integer  "position_x"
    t.integer  "position_y"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "game_id",      null: false
  end

  add_index "tags", ["game_id", "character_id"], name: "index_tags_on_game_id_and_character_id", unique: true, using: :btree

end
