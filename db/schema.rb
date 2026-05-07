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

ActiveRecord::Schema[8.1].define(version: 2026_05_06_115740) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "board_events", force: :cascade do |t|
    t.bigint "card_id", null: false
    t.bigint "column_from_id"
    t.bigint "column_to_id"
    t.datetime "created_at", null: false
    t.string "event_type", null: false
    t.text "new_description"
    t.integer "new_position"
    t.string "new_title"
    t.text "old_description"
    t.integer "old_position"
    t.string "old_title"
    t.datetime "timestamp", null: false
    t.datetime "updated_at", null: false
    t.index ["card_id", "timestamp"], name: "index_board_events_on_card_id_and_timestamp"
    t.index ["card_id"], name: "index_board_events_on_card_id"
    t.index ["column_from_id"], name: "index_board_events_on_column_from_id"
    t.index ["column_to_id"], name: "index_board_events_on_column_to_id"
    t.index ["event_type"], name: "index_board_events_on_event_type"
    t.index ["timestamp"], name: "index_board_events_on_timestamp"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "column_id", null: false
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "position", null: false
    t.string "title", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id", "position"], name: "index_cards_on_column_id_and_position"
    t.index ["column_id"], name: "index_cards_on_column_id"
  end

  create_table "columns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "position", null: false
    t.datetime "updated_at", null: false
    t.index ["position"], name: "index_columns_on_position"
  end

  add_foreign_key "board_events", "cards"
  add_foreign_key "board_events", "columns", column: "column_from_id"
  add_foreign_key "board_events", "columns", column: "column_to_id"
  add_foreign_key "cards", "columns"
end
