# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_11_23_133645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "completed_walks", force: :cascade do |t|
    t.bigint "walk_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_completed_walks_on_user_id"
    t.index ["walk_id"], name: "index_completed_walks_on_walk_id"
  end

  create_table "landmark_tags", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "landmark_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["landmark_id"], name: "index_landmark_tags_on_landmark_id"
    t.index ["tag_id"], name: "index_landmark_tags_on_tag_id"
  end

  create_table "landmarks", force: :cascade do |t|
    t.string "title"
    t.float "latitude"
    t.float "longitude"
    t.text "description"
    t.bigint "creator_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_landmarks_on_creator_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "landmark_id", null: false
    t.bigint "user_id", null: false
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["landmark_id"], name: "index_ratings_on_landmark_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "walk_landmarks", force: :cascade do |t|
    t.bigint "walk_id", null: false
    t.bigint "landmark_id", null: false
    t.integer "landmark_order_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["landmark_id"], name: "index_walk_landmarks_on_landmark_id"
    t.index ["walk_id"], name: "index_walk_landmarks_on_walk_id"
  end

  create_table "walks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "creator_id", null: false
    t.string "spotify_imbed_url"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_walks_on_category_id"
    t.index ["creator_id"], name: "index_walks_on_creator_id"
  end

  add_foreign_key "completed_walks", "users"
  add_foreign_key "completed_walks", "walks"
  add_foreign_key "landmark_tags", "landmarks"
  add_foreign_key "landmark_tags", "tags"
  add_foreign_key "landmarks", "users", column: "creator_id"
  add_foreign_key "ratings", "landmarks"
  add_foreign_key "ratings", "users"
  add_foreign_key "walk_landmarks", "landmarks"
  add_foreign_key "walk_landmarks", "walks"
  add_foreign_key "walks", "categories"
  add_foreign_key "walks", "users", column: "creator_id"
end
