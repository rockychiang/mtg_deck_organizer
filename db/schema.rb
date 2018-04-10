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

ActiveRecord::Schema.define(version: 2018_04_10_224631) do

  create_table "cards", force: :cascade do |t|
    t.string "name"
    t.string "cost"
    t.string "card_type"
    t.string "card_subtype"
    t.string "card_text"
    t.string "power"
    t.string "toughness"
  end

  create_table "deck_cards", force: :cascade do |t|
    t.integer "deck_id"
    t.integer "card_id"
    t.integer "quantity"
  end

  create_table "decks", force: :cascade do |t|
    t.string "name"
    t.string "format"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
