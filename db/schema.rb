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

ActiveRecord::Schema.define(version: 2019_11_01_161038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.text "message"
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "game_id"
    t.integer "user_id"
    t.index ["game_id"], name: "index_chats_on_game_id"
    t.index ["user_id"], name: "index_chats_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.integer "game_turn"
    t.integer "user_turn"
    t.integer "white_player_id"
    t.integer "black_player_id"
    t.integer "winning_user_id"
    t.string "state", default: "open"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["black_player_id"], name: "index_games_on_black_player_id"
    t.index ["white_player_id"], name: "index_games_on_white_player_id"
  end

  create_table "pieces", force: :cascade do |t|
    t.bigint "game_id"
    t.integer "player_id"
    t.integer "x_coordinate"
    t.integer "y_coordinate"
    t.integer "piece_move_count", default: 0
    t.boolean "color_white"
    t.boolean "piece_captured", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "type"
    t.index ["game_id"], name: "index_pieces_on_game_id"
    t.index ["user_id"], name: "index_pieces_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.boolean "is_signed_in", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
