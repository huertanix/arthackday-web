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

ActiveRecord::Schema.define(version: 20131203050011) do

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
    t.integer  "venue_id"
    t.string   "header_image"
    t.string   "header_image_artist"
    t.string   "header_image_artist_website"
    t.string   "theme_excerpt"
    t.string   "slug"
    t.string   "featured_video"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.boolean  "header_image_tiled"
  end

  add_index "events", ["slug"], name: "index_events_on_slug", unique: true

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

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "media", force: true do |t|
    t.text     "snippet"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.string   "photo_url"
  end

  add_index "participants", ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true

  create_table "participants_projects", id: false, force: true do |t|
    t.integer "participant_id", null: false
    t.integer "project_id",     null: false
  end

  create_table "press_blurbs", force: true do |t|
    t.text     "headline",    limit: 255
    t.string   "source_name"
    t.string   "source_url"
    t.string   "logo_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.boolean  "featured"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "tag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.string   "website"
    t.string   "github"
    t.string   "main_image_file_name"
    t.string   "main_image_content_type"
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "featured_thumbnail"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
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
    t.float    "latitude"
    t.float    "longitude"
  end

end
