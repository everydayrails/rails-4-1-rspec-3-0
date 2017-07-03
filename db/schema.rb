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

ActiveRecord::Schema.define(version: 20140916022631) do

  create_table "contacts", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news_releases", force: :cascade do |t|
    t.string   "title"
    t.date     "released_on"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phones", force: :cascade do |t|
    t.integer  "contact_id"
    t.string   "phone"
    t.string   "phone_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["contact_id"], name: "index_phones_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
