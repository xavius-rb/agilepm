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

ActiveRecord::Schema[7.0].define(version: 2022_09_09_232855) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: :cascade do |t|
    t.string "title"
    t.bigint "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_boards_on_project_id"
  end

  create_table "cards", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.string "code"
    t.string "summary"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_cards_on_code"
    t.index ["project_id"], name: "index_cards_on_project_id"
    t.index ["state"], name: "index_cards_on_state"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.bigint "card_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_count"], name: "index_projects_on_card_count"
    t.index ["code"], name: "index_projects_on_code"
  end

  add_foreign_key "boards", "projects"
  add_foreign_key "cards", "projects"
end
