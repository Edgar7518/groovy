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

ActiveRecord::Schema[7.0].define(version: 2022_12_06_222144) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collection_vinyls", force: :cascade do |t|
    t.bigint "vinyl_id", null: false
    t.bigint "collection_id", null: false
    t.boolean "offer_for_trade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_collection_vinyls_on_collection_id"
    t.index ["vinyl_id"], name: "index_collection_vinyls_on_vinyl_id"
  end

  create_table "collections", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "exchanges", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "requested_vinyl_id"
    t.bigint "offered_vinyl_id"
    t.index ["offered_vinyl_id"], name: "index_exchanges_on_offered_vinyl_id"
    t.index ["requested_vinyl_id"], name: "index_exchanges_on_requested_vinyl_id"
    t.index ["user_id"], name: "index_exchanges_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "my_exchanges", force: :cascade do |t|
    t.integer "status"
    t.integer "requested_vinyl_id"
    t.integer "user_id"
    t.integer "offered_vinyl_id"
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

  create_table "vinyls", force: :cascade do |t|
    t.string "title"
    t.integer "year"
    t.text "photo_url"
    t.bigint "artist_id", null: false
    t.bigint "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_vinyls_on_artist_id"
    t.index ["genre_id"], name: "index_vinyls_on_genre_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "vinyl_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishlists_on_user_id"
    t.index ["vinyl_id"], name: "index_wishlists_on_vinyl_id"
  end

  add_foreign_key "collection_vinyls", "collections"
  add_foreign_key "collection_vinyls", "vinyls"
  add_foreign_key "collections", "users"
  add_foreign_key "exchanges", "collection_vinyls", column: "offered_vinyl_id"
  add_foreign_key "exchanges", "collection_vinyls", column: "requested_vinyl_id"
  add_foreign_key "exchanges", "users"
  add_foreign_key "vinyls", "artists"
  add_foreign_key "vinyls", "genres"
  add_foreign_key "wishlists", "users"
  add_foreign_key "wishlists", "vinyls"
end
