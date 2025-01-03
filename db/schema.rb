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

ActiveRecord::Schema.define(version: 2024_12_19_182557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.text "answer1"
    t.text "answer2"
    t.text "answer3"
    t.text "answer4"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "correct_answers"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_questions_on_user_id"
  end

  create_table "quizz_flashcards", force: :cascade do |t|
    t.bigint "quizz_id", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_quizz_flashcards_on_question_id"
    t.index ["quizz_id", "question_id"], name: "index_quizz_flashcards_on_quizz_id_and_question_id", unique: true
    t.index ["quizz_id"], name: "index_quizz_flashcards_on_quizz_id"
  end

  create_table "quizzs", force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_quizzs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "lastname"
    t.string "mail"
    t.string "type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "questions", "users"
  add_foreign_key "quizz_flashcards", "questions"
  add_foreign_key "quizz_flashcards", "quizzs"
  add_foreign_key "quizzs", "users"
end
