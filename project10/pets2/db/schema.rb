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

ActiveRecord::Schema.define(version: 20140219052845) do

  create_table "adopted_pets", force: true do |t|
    t.integer  "cat_id"
    t.integer  "selection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "foster_parent_id"
  end

  add_index "adopted_pets", ["foster_parent_id"], name: "index_adopted_pets_on_foster_parent_id"

  create_table "cats", force: true do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "image_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
  end

  create_table "foster_parents", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pet_id"
  end

  create_table "selections", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
