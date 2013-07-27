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

ActiveRecord::Schema.define(version: 20130727174140) do

# Could not dump table "events" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "events_organizers", id: false, force: true do |t|
    t.integer "event_id",     null: false
    t.integer "organizer_id", null: false
  end

  create_table "events_participants", id: false, force: true do |t|
    t.integer "event_id",       null: false
    t.integer "participant_id", null: false
  end

  create_table "events_venues", id: false, force: true do |t|
    t.integer "event_id", null: false
    t.integer "venue_id", null: false
  end

  create_table "organizers", force: true do |t|
    t.string   "name"
    t.boolean  "event_admin"
    t.boolean  "org_admin"
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

  add_index "organizers", ["email"], name: "index_organizers_on_email", unique: true
  add_index "organizers", ["reset_password_token"], name: "index_organizers_on_reset_password_token", unique: true

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

  create_table "participants_projects", id: false, force: true do |t|
    t.integer "participant_id", null: false
    t.integer "project_id",     null: false
  end

# Could not dump table "press_blurbs" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "projects" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

# Could not dump table "sponsors" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

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
