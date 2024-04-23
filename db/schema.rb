# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_04_23_140916) do
  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "arms", default: 0
    t.integer "legs", default: 0
    t.integer "strength", default: 0
    t.integer "defense", default: 0
    t.integer "health", default: 0
    t.integer "focus", default: 0
    t.integer "speed", default: 0
    t.integer "charisma", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters_weapons", force: :cascade do |t|
    t.integer "weapon_id"
    t.integer "character_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_characters_weapons_on_character_id"
    t.index ["weapon_id"], name: "index_characters_weapons_on_weapon_id"
  end

  create_table "fights", force: :cascade do |t|
    t.string "winner"
    t.integer "player_id"
    t.integer "opponent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opponent_id"], name: "index_fights_on_opponent_id"
    t.index ["player_id"], name: "index_fights_on_player_id"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "arms", default: 0
    t.integer "legs", default: 0
    t.integer "focus", default: 0
    t.integer "power", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fights", "characters", column: "opponent_id"
  add_foreign_key "fights", "characters", column: "player_id"
end
