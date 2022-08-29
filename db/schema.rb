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

ActiveRecord::Schema[7.0].define(version: 2022_08_29_123850) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookmarks", force: :cascade do |t|
    t.string "status"
    t.text "comment"
    t.bigint "kinder_gartens_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kinder_gartens_id"], name: "index_bookmarks_on_kinder_gartens_id"
    t.index ["users_id"], name: "index_bookmarks_on_users_id"
  end

  create_table "kinder_gartens", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.string "phone_number"
    t.string "email"
    t.string "pedagogical_focus"
    t.string "thematic_focus"
    t.integer "total_places"
    t.integer "places_over_3"
    t.integer "places_under_3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "opening_hours", force: :cascade do |t|
    t.string "day"
    t.string "opening_time"
    t.string "closing_time"
    t.bigint "kinder_gartens_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kinder_gartens_id"], name: "index_opening_hours_on_kinder_gartens_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reminders", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "due_date"
    t.bigint "bookmark_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookmark_id"], name: "index_reminders_on_bookmark_id"
  end

  create_table "templates", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookmarks", "kinder_gartens", column: "kinder_gartens_id"
  add_foreign_key "bookmarks", "users", column: "users_id"
  add_foreign_key "opening_hours", "kinder_gartens", column: "kinder_gartens_id"
  add_foreign_key "reminders", "bookmarks"
end
