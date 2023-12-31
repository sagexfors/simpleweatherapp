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

ActiveRecord::Schema[7.0].define(version: 2023_08_15_035435) do
  create_table "current_weathers", force: :cascade do |t|
    t.float "temperature"
    t.float "windspeed"
    t.integer "winddirection"
    t.integer "weathercode"
    t.datetime "time"
    t.integer "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_current_weathers_on_location_id"
  end

  create_table "daily_forecasts", force: :cascade do |t|
    t.integer "location_id", null: false
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_daily_forecasts_on_location_id"
  end

  create_table "hourly_forecasts", force: :cascade do |t|
    t.integer "location_id", null: false
    t.json "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_hourly_forecasts_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "current_weathers", "locations"
  add_foreign_key "daily_forecasts", "locations"
  add_foreign_key "hourly_forecasts", "locations"
end
