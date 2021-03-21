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

ActiveRecord::Schema.define(version: 2021_03_18_121944) do
  create_table "calendars", charset: "utf8mb4", force: :cascade do |t|
    t.string "business_hours"
    t.string "regular_holiday"
    t.string "title"
    t.text "body"
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_calendars_on_store_id"
  end

  create_table "deliveries", charset: "utf8mb4", force: :cascade do |t|
    t.string "deliverer"
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_deliveries_on_store_id"
    t.index ["user_id"], name: "index_deliveries_on_user_id"
  end

  create_table "question_answers", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_question_answers_on_store_id"
  end

  create_table "reservations", charset: "utf8mb4", force: :cascade do |t|
    t.string "date_at"
    t.string "date_on"
    t.integer "number_people"
    t.string "menu"
    t.integer "budget"
    t.text "inquiry"
    t.string "reservation_number"
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_reservations_on_store_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "store_discount_info_notifications", charset: "utf8mb4", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_store_discount_info_notifications_on_store_id"
    t.index ["user_id"], name: "index_store_discount_info_notifications_on_user_id"
  end

  create_table "stores", charset: "utf8mb4", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_stores_on_confirmation_token", unique: true
    t.index ["email"], name: "index_stores_on_email", unique: true
    t.index ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_stores_on_uid_and_provider", unique: true
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "furigana"
    t.string "image"
    t.string "email"
    t.string "tel"
    t.string "birthday"
    t.string "six"
    t.string "address"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  create_table "word_mouths", charset: "utf8mb4", force: :cascade do |t|
    t.string "visit_day"
    t.string "title"
    t.text "body"
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_id"], name: "index_word_mouths_on_store_id"
    t.index ["user_id"], name: "index_word_mouths_on_user_id"
  end

  add_foreign_key "calendars", "stores"
  add_foreign_key "deliveries", "stores"
  add_foreign_key "deliveries", "users"
  add_foreign_key "question_answers", "stores"
  add_foreign_key "reservations", "stores"
  add_foreign_key "reservations", "users"
  add_foreign_key "store_discount_info_notifications", "stores"
  add_foreign_key "store_discount_info_notifications", "users"
  add_foreign_key "word_mouths", "stores"
  add_foreign_key "word_mouths", "users"
end