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

ActiveRecord::Schema.define(version: 20130407115312) do

  create_table "ameblo_images", force: true do |t|
    t.string   "url"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ameblo_images", ["url"], name: "index_ameblo_images_on_url"

  create_table "caches", force: true do |t|
    t.string   "key"
    t.text     "body"
    t.datetime "expire_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "caches", ["key"], name: "index_caches_on_key"

  create_table "keitaidenwas", force: true do |t|
    t.string   "phone"
    t.string   "url"
    t.date     "at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seiyu_id"
    t.text     "description"
  end

  add_index "keitaidenwas", ["at"], name: "index_keitaidenwas_on_at"
  add_index "keitaidenwas", ["phone"], name: "index_keitaidenwas_on_phone"
  add_index "keitaidenwas", ["seiyu_id"], name: "index_keitaidenwas_on_seiyu_id"

  create_table "seiyus", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "seiyus", ["name"], name: "index_seiyus_on_name"

  create_table "tweets", force: true do |t|
    t.text     "json"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tweets", ["url"], name: "index_tweets_on_url"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
