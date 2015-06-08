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

ActiveRecord::Schema.define(version: 20150608093706) do

  create_table "customers", force: :cascade do |t|
    t.string   "username",   limit: 255, null: false
    t.string   "email",      limit: 255, null: false
    t.string   "password",   limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "food_like_profile_relations", force: :cascade do |t|
    t.integer  "profile_id",   limit: 4, null: false
    t.integer  "food_like_id", limit: 4, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "food_like_profile_relations", ["profile_id", "food_like_id"], name: "index_food_like_profile_relations_on_profile_id_and_food_like_id", unique: true, using: :btree

  create_table "food_likes", force: :cascade do |t|
    t.string "value", limit: 255, null: false
  end

  add_index "food_likes", ["value"], name: "index_food_likes_on_value", unique: true, using: :btree

  create_table "hair_profile_relations", force: :cascade do |t|
    t.integer  "profile_id", limit: 4, null: false
    t.integer  "hair_id",    limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "hair_profile_relations", ["profile_id", "hair_id"], name: "index_hair_profile_relations_on_profile_id_and_hair_id", unique: true, using: :btree

  create_table "hairs", force: :cascade do |t|
    t.string "value", limit: 255, null: false
  end

  add_index "hairs", ["value"], name: "index_hairs_on_value", unique: true, using: :btree

  create_table "hobbies", force: :cascade do |t|
    t.string "value", limit: 255, null: false
  end

  add_index "hobbies", ["value"], name: "index_hobbies_on_value", unique: true, using: :btree

  create_table "hobby_profile_relations", force: :cascade do |t|
    t.integer  "profile_id", limit: 4, null: false
    t.integer  "hobby_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "hobby_profile_relations", ["profile_id", "hobby_id"], name: "index_hobby_profile_relations_on_profile_id_and_hobby_id", unique: true, using: :btree

  create_table "locations", force: :cascade do |t|
    t.string "city",      limit: 255, null: false
    t.string "country",   limit: 255, null: false
    t.float  "latitude",  limit: 24
    t.float  "longitude", limit: 24
  end

  add_index "locations", ["city", "country"], name: "index_locations_on_city_and_country", unique: true, using: :btree

  create_table "particularities", force: :cascade do |t|
    t.string "value", limit: 255, null: false
  end

  add_index "particularities", ["value"], name: "index_particularities_on_value", unique: true, using: :btree

  create_table "particularity_profile_relations", force: :cascade do |t|
    t.integer  "profile_id",       limit: 4, null: false
    t.integer  "particularity_id", limit: 4, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "particularity_profile_relations", ["profile_id", "particularity_id"], name: "particularity_profile_relation_on_profile_id_and_particularity", unique: true, using: :btree

  create_table "pending_profiles", force: :cascade do |t|
  end

  add_index "pending_profiles", ["id"], name: "index_pending_profiles_on_id", unique: true, using: :btree

  create_table "profiles", force: :cascade do |t|
    t.string   "picture",         limit: 255,              null: false
    t.integer  "age",             limit: 4
    t.string   "eyes",            limit: 255, default: ""
    t.string   "profession",      limit: 255, default: ""
    t.string   "origins",         limit: 255, default: ""
    t.string   "alcohol",         limit: 255, default: ""
    t.string   "smoke",           limit: 255, default: ""
    t.string   "alimentation",    limit: 255, default: ""
    t.string   "apparence",       limit: 255, default: ""
    t.integer  "height",          limit: 4
    t.integer  "weight",          limit: 4
    t.integer  "popularity",      limit: 4,                null: false
    t.integer  "mails",           limit: 4,                null: false
    t.integer  "charms",          limit: 4,                null: false
    t.integer  "visits",          limit: 4,                null: false
    t.integer  "buckets",         limit: 4,                null: false
    t.integer  "total",           limit: 4,                null: false
    t.integer  "location_id",     limit: 4
    t.datetime "last_connection",                          null: false
    t.boolean  "online",          limit: 1,                null: false
  end

  create_table "style_profile_relations", force: :cascade do |t|
    t.integer  "profile_id", limit: 4, null: false
    t.integer  "style_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "style_profile_relations", ["profile_id", "style_id"], name: "particularity_profile_relation_on_profile_id_and_particularity", unique: true, using: :btree

  create_table "styles", force: :cascade do |t|
    t.string "value", limit: 255, null: false
  end

  add_index "styles", ["value"], name: "index_styles_on_value", unique: true, using: :btree

end
