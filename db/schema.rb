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

ActiveRecord::Schema.define(version: 2021_06_02_165429) do

  create_table "activities", id: { type: :binary, limit: 16 }, force: :cascade do |t|
    t.binary "activity_type_id"
    t.string "name"
    t.string "description"
    t.string "location"
    t.binary "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_type_id"], name: "index_activities_on_activity_type_id"
    t.index ["user_id"], name: "index_activities_on_user_id"
  end

  create_table "activity_types", id: { type: :binary, limit: 16 }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bookings", id: { type: :binary, limit: 16 }, force: :cascade do |t|
    t.binary "schedule_id"
    t.binary "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["schedule_id"], name: "index_bookings_on_schedule_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "schedules", id: { type: :binary, limit: 16 }, force: :cascade do |t|
    t.binary "activity_id"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_id"], name: "index_schedules_on_activity_id"
  end

  create_table "users", id: { type: :binary, limit: 16 }, force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.boolean "admin"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "activities", "activity_types"
  add_foreign_key "activities", "users"
  add_foreign_key "bookings", "schedules"
  add_foreign_key "bookings", "users"
  add_foreign_key "schedules", "activities"
end
