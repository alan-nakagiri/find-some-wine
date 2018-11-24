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

ActiveRecord::Schema.define(version: 2018_11_20_064707) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_tokens", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.string "token", null: false
    t.datetime "expires_at"
    t.index ["users_id"], name: "index_access_tokens_on_users_id"
  end

  create_table "identities", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "recovery_token"
    t.datetime "recovery_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marked_wineries", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.integer "winery_id", null: false
    t.integer "rating"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_marked_wineries_on_users_id"
  end

  create_table "marked_wines", force: :cascade do |t|
    t.bigint "users_id", null: false
    t.integer "wine_id", null: false
    t.integer "rating"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["users_id"], name: "index_marked_wines_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "varietals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wineries", force: :cascade do |t|
    t.bigint "wines_id", null: false
    t.string "name"
    t.string "address"
    t.decimal "longitude"
    t.decimal "latitude"
    t.string "phone"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["wines_id"], name: "index_wineries_on_wines_id"
  end

  create_table "wines", force: :cascade do |t|
    t.bigint "wineries_id", null: false
    t.bigint "varietals_id"
    t.string "name"
    t.string "type"
    t.string "vintage"
    t.string "abv"
    t.string "state"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["varietals_id"], name: "index_wines_on_varietals_id"
    t.index ["wineries_id"], name: "index_wines_on_wineries_id"
  end

end
