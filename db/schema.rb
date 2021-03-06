# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130808084015) do

  create_table "employee", :id => false, :force => true do |t|
    t.string "name"
    t.string "dept"
    t.string "jobtitle"
  end

  create_table "flash_cards", :force => true do |t|
    t.integer  "flash_deck_id"
    t.string   "front"
    t.string   "back"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "flash_cards", ["flash_deck_id", "created_at"], :name => "index_flash_cards_on_flash_deck_id_and_created_at"

  create_table "flash_decks", :force => true do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "flash_decks", ["user_id", "created_at"], :name => "index_flash_decks_on_user_id_and_created_at"

  create_table "goals", :force => true do |t|
    t.string   "name"
    t.decimal  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :id => false, :force => true do |t|
    t.integer  "id",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.datetime "total_time"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
