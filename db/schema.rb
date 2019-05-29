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

ActiveRecord::Schema.define(version: 2019_05_29_150357) do

  create_table "dramas", force: :cascade do |t|
    t.string "title_japanese"
    t.string "title_english"
    t.integer "year"
    t.integer "month"
    t.string "drama_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "drama_id"
    t.string "episode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drama_id", "episode"], name: "index_episodes_on_drama_id_and_episode", unique: true
    t.index ["drama_id"], name: "index_episodes_on_drama_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id"
    t.integer "qa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qa_id"], name: "index_favorites_on_qa_id"
    t.index ["user_id", "qa_id"], name: "index_favorites_on_user_id_and_qa_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "qas", force: :cascade do |t|
    t.integer "episode_id"
    t.integer "order_in_episode"
    t.string "question"
    t.string "answer"
    t.string "soundfile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["episode_id"], name: "index_qas_on_episode_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "user_id"
    t.integer "qa_id"
    t.string "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["qa_id"], name: "index_results_on_qa_id"
    t.index ["user_id", "qa_id", "result"], name: "index_results_on_user_id_and_qa_id_and_result", unique: true
    t.index ["user_id"], name: "index_results_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
