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

ActiveRecord::Schema.define(version: 20141125004817) do

  create_table "events", force: :cascade do |t|
    t.string   "city",                        limit: 255
    t.string   "theme",                       limit: 255
    t.datetime "hackathon_start"
    t.datetime "hackathon_end"
    t.datetime "show_start"
    t.datetime "show_end"
    t.text     "about"
    t.string   "hack_rsvp_url",               limit: 255
    t.string   "show_rsvp_url",               limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "venue_id"
    t.string   "header_image",                limit: 255
    t.string   "header_image_artist",         limit: 255
    t.string   "header_image_artist_website", limit: 255
    t.string   "theme_excerpt",               limit: 255
    t.string   "slug",                        limit: 255
    t.text     "featured_video"
    t.string   "featured_image_file_name",    limit: 255
    t.string   "featured_image_content_type", limit: 255
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.boolean  "header_image_tiled"
    t.boolean  "header_dark_font"
    t.text     "organizer_section"
    t.index ["slug"], name: "index_events_on_slug", unique: true
  end

  create_table "events_organizers", id: false, force: :cascade do |t|
    t.integer "event_id",     null: false
    t.integer "organizer_id", null: false
  end

  create_table "events_participants", id: false, force: :cascade do |t|
    t.integer "event_id",       null: false
    t.integer "participant_id", null: false
  end

  create_table "events_venues", id: false, force: :cascade do |t|
    t.integer "event_id", null: false
    t.integer "venue_id", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "media", force: :cascade do |t|
    t.text     "snippet"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "organizers", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.boolean  "org_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.index ["email"], name: "index_organizers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_organizers_on_reset_password_token", unique: true
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "bio",                    limit: 255
    t.string   "twitter_handle",         limit: 255
    t.string   "website",                limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "photo_url",              limit: 255
    t.index ["reset_password_token"], name: "index_participants_on_reset_password_token", unique: true
  end

  create_table "participants_projects", id: false, force: :cascade do |t|
    t.integer "participant_id", null: false
    t.integer "project_id",     null: false
  end

  create_table "photos", force: :cascade do |t|
    t.text     "credit"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "press_blurbs", force: :cascade do |t|
    t.text     "headline",    limit: 255
    t.string   "source_name", limit: 255
    t.string   "source_url",  limit: 255
    t.string   "logo_uri",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.boolean  "featured"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.text     "description"
    t.string   "tag",                     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.string   "website",                 limit: 255
    t.string   "github",                  limit: 255
    t.string   "main_image_file_name",    limit: 255
    t.string   "main_image_content_type", limit: 255
    t.integer  "main_image_file_size"
    t.datetime "main_image_updated_at"
    t.string   "featured_thumbnail",      limit: 255
    t.string   "slug",                    limit: 255
    t.index ["slug"], name: "index_projects_on_slug", unique: true
  end

  create_table "sponsors", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "website",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.boolean  "featured"
  end

  create_table "venues", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "address",     limit: 255
    t.string   "city",        limit: 255
    t.string   "subdivision", limit: 255
    t.string   "country",     limit: 255
    t.string   "postal_code", limit: 255
    t.string   "website",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

end
