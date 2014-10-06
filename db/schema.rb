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

ActiveRecord::Schema.define(version: 20140817161039) do

  create_table "foods", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", force: true do |t|
    t.integer  "ingredient_id"
    t.string   "name"
    t.string   "genre"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "procedures", force: true do |t|
    t.integer  "number"
    t.text     "detail"
    t.integer  "sec"
    t.boolean  "play",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "recipe_id"
  end

  add_index "procedures", ["recipe_id"], name: "index_procedures_on_recipe_id"

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name"
    t.string   "pic_content_type"
    t.integer  "pic_file_size"
    t.datetime "pic_updated_at"
  end

  create_table "values", force: true do |t|
    t.integer  "food_id"
    t.integer  "recipe_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "values", ["food_id"], name: "index_values_on_food_id"
  add_index "values", ["recipe_id"], name: "index_values_on_recipe_id"

end
