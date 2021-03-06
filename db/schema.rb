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

ActiveRecord::Schema.define(version: 2020_10_23_131401) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.string "difficulty"
    t.string "inc1"
    t.string "inc2"
    t.string "inc3"
    t.string "correct"
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "theme_categories", force: :cascade do |t|
    t.integer "theme_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "index_theme_categories_on_category_id"
    t.index ["theme_id"], name: "index_theme_categories_on_theme_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "title"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_themes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "picture"
    t.text "bio"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
  end

  add_foreign_key "questions", "categories"
  add_foreign_key "results", "users"
  add_foreign_key "theme_categories", "categories"
  add_foreign_key "theme_categories", "themes"
  add_foreign_key "themes", "users"
end
