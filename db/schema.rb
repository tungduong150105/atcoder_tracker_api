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

ActiveRecord::Schema[8.1].define(version: 2026_05_18_091216) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "problems", force: :cascade do |t|
    t.string "atcoder_id"
    t.string "author"
    t.datetime "created_at", null: false
    t.text "description"
    t.jsonb "hints", default: []
    t.integer "rating"
    t.jsonb "sample_test", default: []
    t.integer "solved"
    t.jsonb "tags", default: []
    t.string "title"
    t.integer "tried"
    t.text "tutorial_code"
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "submit_records", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "execution_time"
    t.integer "memory_used"
    t.bigint "problem_id", null: false
    t.string "status"
    t.string "submission_id"
    t.datetime "submitted_at"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["problem_id"], name: "index_submit_records_on_problem_id"
    t.index ["user_id"], name: "index_submit_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "atcoder_handle"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "password_digest"
    t.integer "rating"
    t.datetime "updated_at", null: false
    t.string "username"
  end

  add_foreign_key "submit_records", "problems"
  add_foreign_key "submit_records", "users"
end
