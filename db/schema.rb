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

ActiveRecord::Schema.define(:version => 20130724230915) do

  create_table "addresses", :force => true do |t|
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "street"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "hotel_id"
  end

  create_table "hotels", :force => true do |t|
    t.string   "title"
    t.float    "star_rating"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "rates_count"
    t.string   "hphoto"
  end

  create_table "photos", :force => true do |t|
    t.integer  "room_id"
    t.string   "link"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rooms", :force => true do |t|
    t.integer  "hotel_id"
    t.string   "room_type"
    t.float    "price"
    t.boolean  "breakfast_included"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "photo"
    t.integer  "room_number"
  end

  create_table "user_hotels", :force => true do |t|
    t.integer  "user_id"
    t.integer  "hotel_id"
    t.integer  "rating"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
