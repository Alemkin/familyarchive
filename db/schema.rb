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

ActiveRecord::Schema.define(version: 20160529012708) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artifacts", force: :cascade do |t|
    t.string   "artifact_name"
    t.string   "short_description"
    t.string   "story_text"
    t.string   "image_url",           array: true
    t.string   "video_url"
    t.string   "subject_author_name"
    t.string   "family_name"
    t.string   "artifact_type"
    t.datetime "exact_date"
    t.string   "estimated_date"
    t.string   "content_tag",         array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "transcribed_text"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "is_admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
