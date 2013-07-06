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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130706223913) do

  create_table "events", force: true do |t|
    t.string   "city"
    t.string   "theme"
    t.datetime "hackathon_start"
    t.datetime "hackathon_end"
    t.datetime "show_start"
    t.datetime "show_end"
    t.text     "about"
    t.string   "hack_rsvp_url"
    t.string   "show_rsvp_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "participants", force: true do |t|
    t.string   "name"
    t.string   "bio"
    t.string   "twitter_handle"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "participants", ["email"], name: "index_participants_on_email", unique: true
  add_index "participants", ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true

  create_table "press_blurbs", force: true do |t|
    t.string   "headline"
    t.string   "source_name"
    t.string   "source_url"
    t.string   "logo_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.string   "logo_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "venues", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "subdivision"
    t.string   "country"
    t.string   "postal_code"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
